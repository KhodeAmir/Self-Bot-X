pat = { "^(ping)$",
        "^(help)$",
        "^(panel)$",
        "^(dump)$",
        "^(leave)$",
        "^(ass)$",
        "^(mute)$",
        "^(mute) (.*)$",
        "^(delall)$",
        "^(delall) (.*)$",
        "^(unmute)$",
        "^(unmute) (.*)$",
        "^(kick)$",
        "^(kick) (.*)$",
        "^(whois) (.*)$",
        "^(block) (.*)$",
        "^(unblock) (.*)$",
        "^(mydel)$",
        "^(tagall)$",
        "^(inv) (.*)$",
        "^(share)$",
        "^(id)$",
        "^(inv)$",
        "^(flood) (.*)$",
        "^(block)$",
        "^(private settings)$",
       "^(texttype) (.*)$",
       "^(markread) (.*)$",
       "^(biotime) (.*)$",
       "^(setmainbio) (.*)$",
       "^(self) (.*)$",
       "^(read message) (.*)$"
}

function run(msg,crco)
    if is_sudo(msg.sender_user_id) then
if crco[1] == 'ping' then
     tdbot.editMessageText(msg.chat_id, msg.id, 'READY', 'md', false, 0, nil, nil, nil)

end
if crco[1] == 'whois' then
   getMainUser =  function(arg,crco_)
  
    getMainUserFull =  function(arg,co)
        if crco_ and crco_._ == 'error' then
            text = "Message : <b>Access Denied</b>\nError : <b>"..co.message.."</b>"
        tdbot.editMessageText(msg.chat_id, msg.id, text, 'html', false, 0, nil, nil, nil)
    else
firstname = ('|'..crco_.first_name..'|' or '')
if crco_.phone_number then
    number = '|'..string.sub(crco_.phone_number, 1, 8)..'####|'
else
number = '|NOT ACS|'
end
lastname = '|'..crco_.last_name..'|' or ''
    userstatus = getUserStatus(crco_.status)
    userType = getUserType(crco_.type)
    bio = '|'..co.bio..'|' or ''
    if crco_.profile_photo then
    tdbot.downloadFile(crco_.profile_photo.big.id, 1, nil, nil)
    end
    common_count = '|'..co.group_in_common_count..'|'
 if co.can_be_called then
    acsscall = '|Blocked|'
 else
    acsscall = '|Not Blocked|'
 end
 if co.has_private_calls then
    private_call = '|Private|'
 else
    private_call = 'EveryBody'
 end
 text = '☤ *User Fully info* ☤ \n☤ *First Name* `:` *'..firstname..'*\n☤ *Last Name* `:` *'..lastname..'*\n☤* Phone Number* `:` *'..number..'*\n☤* Bio* `:` *'..bio..'*\n☤ *Status* `:` *'..userstatus..'*\n☤ *Type* `:` *'..userType..'* \n☤ *Chat With Self* `:` *'..common_count..'*\n☤* Call* `:` *'..acsscall..'*\n☤* Private Call* `:` *'..private_call..'*'
if string.len(crco_.profile_photo.big["local"].path) > 0 then
    tdbot.deleteMessages(msg.chat_id,{[1] =msg.id})
 tdbot.sendPhoto(msg.chat_id,msg.id,crco_.profile_photo.big["local"].path, text, 'md',0, 0, 0, false, true, nil, nil, nil)
elseif crco_.profile_photo and string.len(crco_.profile_photo.big["local"].path) == 0  then
    tdbot.editMessageText(msg.chat_id, msg.id, 'Message : *Search Completed !*\n`whois '..tonumber(crco[2])..'`', 'md', false, 0, nil, nil, nil)
elseif not crco_.profile_photo then
    tdbot.editMessageText(msg.chat_id, msg.id, text, 'md', false, 0, nil, nil, nil)
end
    
   end
end
   tdbot.getUserFullInfo(tonumber(crco[2]), getMainUserFull, nil)
end
   tdbot.getUser(tonumber(crco[2]), getMainUser, nil)
end

if crco[1] == 'leave' then
    getMainLEFT=  function(tet,co)
        if co and co._ == 'error' then
            text = "Message : <b>Access Denied</b>\n<b>"..co.message.."</b>"
        else
            text = '<b>Bye :)</b>'
        end
        tdbot.editMessageText(msg.chat_id, msg.id, text, 'html', false, 0, nil, nil, nil)
    end
    tdbot.leaveChat(msg.chat_id,getMainLEFT,nil)
end
if crco[1] == 'mute' and tonumber(msg.reply_to_message_id) > 0  then
    GetMainMessage=   function(arg,CR)
      getMainMute(CR.sender_user_id,msg)
      end
        tdbot.getMessage(msg.chat_id, tonumber(msg.reply_to_message_id),GetMainMessage,nil)
    end
    if crco[1] == 'mute' and crco[2] and crco[2]:match('^%d+$')then
        getMainMute(crco[2],msg)
    end
    if crco[1] == 'mute'  and crco[2] and not crco[2]:match('^%d+$') then
        getMainUsername = function(ex,CR)
          if not CR.id then
            return tdbot.editMessageText(msg.chat_id, msg.id,'Message : *User* :`'..ec_name(crco[2])..'` * is Not Found *','md',false, 0, nil, nil, nil)
            else
                getMainMute(CR.id,msg)
        end
        end
        tdbot.searchPublicChat(crco[2],getMainUsername,nil)
        end 
        if crco[1] == 'unmute' and tonumber(msg.reply_to_message_id) > 0  then
            GetMainMessage=   function(arg,CR)
              getMainUnMute(CR.sender_user_id,msg)
              end
                tdbot.getMessage(msg.chat_id, tonumber(msg.reply_to_message_id),GetMainMessage,nil)
            end
            if crco[1] == 'unmute' and crco[2] and crco[2]:match('^%d+$')then
                getMainUnMute(crco[2],msg)
            end
            if crco[1] == 'unmute'  and crco[2] and not crco[2]:match('^%d+$') then
                getMainUsername = function(ex,CR)
                  if not CR.id then
                    return tdbot.editMessageText(msg.chat_id, msg.id,'Message : *User* :`'..ec_name(crco[2])..'` * is Not Found *','md',false, 0, nil, nil, nil)
                    else
                        getMainUnMute(CR.id,msg)
                end
                end
                tdbot.searchPublicChat(crco[2],getMainUsername,nil)
                end 
if crco[1] == 'kick' and tonumber(msg.reply_to_message_id) > 0  then
    GetMainMessage=   function(arg,CR)
      getMainBanned(CR.sender_user_id,msg)
      end
        tdbot.getMessage(msg.chat_id, tonumber(msg.reply_to_message_id),GetMainMessage,nil)
    end
    if crco[1] == 'kick' and crco[2] and crco[2]:match('^%d+$')then
        getMainBanned(crco[2],msg)
    end
    if crco[1] == 'kick'  and crco[2] and not crco[2]:match('^%d+$') then
        getMainUsername = function(ex,CR)
          if not CR.id then
            return tdbot.editMessageText(msg.chat_id, msg.id,'Message : *User* :`'..ec_name(crco[2])..'` * is Not Found *','md',false, 0, nil, nil, nil)
            else
                getMainBanned(CR.id,msg)
        end
        end
        tdbot.searchPublicChat(crco[2],getMainUsername,nil)
        end 
if crco[1] == 'block' and crco[2] and crco[2]:match('^%d+$') then
    Mainblockuser(crco[2],msg)
end
if crco[1] == 'unblock' and crco[2] and crco[2]:match('^%d+$') then
    Mainunblockuser(crco[2],msg)
end
if crco[1] == 'block' and tonumber(msg.reply_to_message_id) > 0  then
    GetMainMessage=   function(arg,CR)
      Mainblockuser(CR.sender_user_id,msg)
      end
        tdbot.getMessage(msg.chat_id, tonumber(msg.reply_to_message_id),GetMainMessage,nil)
    end
    if crco[1] == 'unblock' and tonumber(msg.reply_to_message_id) > 0  then
        GetMainMessage=   function(arg,CR)
          Mainunblockuser(CR.sender_user_id,msg)
          end
            tdbot.getMessage(msg.chat_id, tonumber(msg.reply_to_message_id),GetMainMessage,nil)
        end
        if crco[1] == 'block'  and crco[2] and not crco[2]:match('^%d+$') then
            getMainUsername = function(ex,CR)
              if not CR.id then
                return tdbot.editMessageText(msg.chat_id, msg.id,'Message : *User* :`'..ec_name(crco[2])..'` * is Not Found *','md',false, 0, nil, nil, nil)
                else
                  Mainblockuser(CR.id,msg)
            end
            end
            tdbot.searchPublicChat(crco[2],getMainUsername,nil)
            end 
            if crco[1] == 'unblock' and crco[2] and not crco[2]:match('^%d+$') then
                getMainUsername = function(ex,CR)
                  if not CR.id then
                    return tdbot.editMessageText(msg.chat_id, msg.id,'Message : *User* :`'..ec_name(crco[2])..'` * is Not Found *','md',false, 0, nil, nil, nil)
                    else
                      Mainunblockuser(CR.id,msg)
                end
                end
                tdbot.searchPublicChat(crco[2],getMainUsername,nil)
                end 
                if crco[1] == 'delall' and crco[2] and crco[2]:match('^%d+$') then
                    mainDelallMessage(crco[2],msg)
                end
                if crco[1] == 'delall' and tonumber(msg.reply_to_message_id) > 0  then
                    GetMainMessage=   function(arg,CR)
                        mainDelallMessage(CR.sender_user_id,msg)
                      end
                        tdbot.getMessage(msg.chat_id, tonumber(msg.reply_to_message_id),GetMainMessage,nil)
                    end
                    if crco[1] == 'delall'  and crco[2] and not crco[2]:match('^%d+$') then
                        getMainUsername = function(ex,CR)
                          if not CR.id then
                            return tdbot.editMessageText(msg.chat_id, msg.id,'Message : *User* :`'..ec_name(crco[2])..'` * is Not Found *','md',false, 0, nil, nil, nil)
                            else
                                mainDelallMessage(CR.id,msg)
                        end
                        end
                        tdbot.searchPublicChat(crco[2],getMainUsername,nil)
                        end 
                       
if crco[1] == 'share' then
    tdbot.deleteMessages(msg.chat_id,{[1] =msg.id})
    return tdbot.sendContact(msg.chat_id,(msg.reply_to_message_id or msg.id), bot.phone_number, bot.name, bot.last_name, bot.id, false, true, nil, nil, nil)
    end
    if crco[1] == 'flood' and tonumber(msg.reply_to_message_id) > 0 then
     tdbot.getMessage(msg.chat_id, tonumber(msg.reply_to_message_id),function(cr,co)
        for i=1,crco[2] do
          tdbot.forwardMessages(msg.chat_id, msg.chat_id, {[1] = msg.reply_to_message_id}, 1)
        end
    end)
end

        if crco[1] == 'mydel' then
            getMainMessage_ = function(arg,co)
                if co and co._ == 'error' then
                    text = "Message : <b>Access Denied</b>\n<b>"..co.message.."</b>"

                end
                tdbot.editMessageText(msg.chat_id, msg.id, text, 'html', false, 0, nil, nil, nil)

            end
                    tdbot.deleteChatMessagesFromUser(msg.chat_id, bot.id, getMainMessage_, nil)
                end
            
                if crco[1] == 'ass' then
                res,status = http.request("http://api.obutts.ru/noise/"..math.random(1,999).."/"..math.random(1,100))
 
                local data = encode_json.decode(res)[math.random(1,100)]
                 if data then 
                    tdbot.deleteMessages(msg.chat_id,{[1] =msg.id})
                    file =  Download('http://media.obutts.ru/' .. data.preview,'/CO.jpg')
          tdbot.sendPhoto(msg.chat_id,msg.id, file, 'ID : *'..data.id..'*', 'md',0, 0, 0, false, true, nil, nil, nil)

               os.execute('rm ./CRCO/CO.jpg')
                else 
                    tdbot.editMessageText(msg.chat_id, msg.id, 'Error 404 ,  try again' , 'md', false, 0, nil, nil, nil)


                end
            end
    if crco[1] == 'id' and tonumber(msg.reply_to_message_id) > 0 then
        getMainMesages = function(arg,co)
            tdbot.editMessageText(msg.chat_id, msg.id, last..'*User ID* : `'..co.sender_user_id..'`', 'md', false, 0, nil, nil, nil)

        end
        tdbot.getMessage(msg.chat_id, tonumber(msg.reply_to_message_id),getMainMesages,nil)
    end
if crco[1] == 'inv' and crco[2] and crco[2]:match('^%d+$') then
  invateUser(tonumber(crco[2]),msg)
end
if crco[1] == 'inv' and tonumber(msg.reply_to_message_id) > 0  then
    GetMainMessage=   function(arg,CR)
        invateUser(CR.sender_user_id,msg)
      end
        tdbot.getMessage(msg.chat_id, tonumber(msg.reply_to_message_id),GetMainMessage,nil)
    end
if crco[1] == 'inv' and crco[2] and not crco[2]:match('^%d+$') then
    invMainuser = function(ex,CR)
      if not CR.id then
        return tdbot.editMessageText(msg.chat_id, msg.id,'Message : *User * :`'..ec_name(crco[2])..'` * is Not Found *','md',false, 0, nil, nil, nil)

        else
           invateUser(tonumber(CR.id),msg)
    end
    end

    tdbot.searchPublicChat(crco[2],invMainuser,nil)
    end
if crco[1] == 'panel' then
 markread = returndata(Get('for_all','markread'))
 if Get('for_all','self-off') then
    selfstatus = '|D|'
 else
    selfstatus = '|E|'
 end
 readmessage = returndata(Get('other','ReadMessage:'..msg.chat_id))
 texttype = returndata(Get('other','TextType'))
 enemymod = returndata(Get('for_all','ENEMY:FI'))
mainclerktext = returndata(Get('other','clerk:text'))
 timestatusBio = returndata(Get('other','Self-Time')) 
 textBioMain = returndata(Get('other','Self-Bio-MAIN'))
clerkmod = returndata(Get('other','clerkTYPE'))
clerkstatus = returndata(Get('other','ClerkMod'))
text_ = '☤ *Self Status* _:_ *'..selfstatus..'*\n☤ *Markread* `:` *'..markread..'*\n☤ *Clerk* `:` *'..clerkstatus..'*\n☤ *Clerk Type* `:` *'..clerkmod..'*\n☤ *Clerk MTEXT* `:` *'..mainclerktext..'*\n☤ *Enemy Mod * `:` *'..enemymod..'*\n☤ *Read Message* `:` *'..readmessage..'*\n☤ *Text Type* `:` *'..texttype:upper()..'*\n☤ *Time in Bio* `:` *'..timestatusBio..'*\n☤ *Main Bio* `:` *'..textBioMain..'*'
return tdbot.editMessageText(msg.chat_id, msg.id, text_..SelfVersion, 'md', false, 0, nil, nil, nil)
end
 if crco[1] == 'markread' and crco[2] then
    if crco[2] == 'on' then
              markread = true
elseif crco[2] == 'off' then
    markread = nil
else
    return
end
if markread then 
    save('for_all','markread',true)
    return tdbot.editMessageText(msg.chat_id,msg.id,'Message : Mark message in chats successfully enabled !', 'md', false, 0, nil, nil, nil)
else 
    del('for_all','markread')
    return tdbot.editMessageText(msg.chat_id,msg.id,'Message : Mark message in chats successfully disabled !', 'md', false, 0, nil, nil, nil)
end
end
if crco[1] == 'enemy' and crco[2] then
    if crco[2] == 'on' then
              EN = true
elseif crco[2] == 'off' then
    EN = nil
else
    return
end
if EN then 
    save('for_all','ENEMY:FI',true)
    return tdbot.editMessageText(msg.chat_id,msg.id,'Message : Enemy mod successfully enabled !', 'md', false, 0, nil, nil, nil)
else 
    del('for_all','ENEMY:FI')
    return tdbot.editMessageText(msg.chat_id,msg.id,'Message : Enemy mod successfully disabled !', 'md', false, 0, nil, nil, nil)
end
end
if crco[1] == 'read message' and crco[2] then
    if crco[2] == 'on' then
        read = true
    elseif crco[2] == 'off' then
        read = nil
    else
        return
    end

    if read then
    save('other','ReadMessage:'..msg.chat_id,true)
       return tdbot.editMessageText(msg.chat_id, msg.id, 'Message: *Read all the Mentions in Chat successfully enabled !*', 'md', false, 0, nil, nil, nil)
    else
        del('other','ReadMessage:'..msg.chat_id)
        return tdbot.editMessageText(msg.chat_id, msg.id, 'Message: *Read all the Mentions in Chat has beed disabled !*', 'md', false, 0, nil, nil, nil)

    end
end 
if crco[1] == 'self' and crco[2] then
    if crco[2] == 'on' then
        self = true
    elseif crco[2] == 'off' then
        self = nil
    else
        return
    
    end
    if self then 
        del('for_all','self-off')
        text=  'Message : *Self-Project has been enabled !*'

    else
       
        save('for_all','self-off',true)

        text = 'Message : *Self-Project has been disabled !*'
    end
        tdbot.editMessageText(msg.chat_id, msg.id, text, 'md', false, 0, nil, nil, nil)

end

if crco[1] == 'private settings' then
  local  function  getstatus_(crco,pri)

    
    
            forwardMessage = getStatus(pri)
     

      function getprofilePhoto (arg,pri)
 
  
        ProfilePhotos = getStatus(pri)
  

    function getonlinestatus(arg,pri)
 
            StatusOnline = getStatus(pri)
       
      

     function getstatusinvate(arg,pri)
       
    
                InvateChat = getStatus(pri)
         

     function getstatuscalls(arg,pri)
     
    
            Calls = getStatus(pri)
text = '☤ *Self-Private-Settings* ☤ \n☤ *Forward Message* `:` *'..(forwardMessage or "i can't Get Data")..'*\n☤ *Profile Photos* `:` *'..(ProfilePhotos or "i can't Get Data")..'*\n☤ *Calls* `:` *'..(Calls or "i can't Get Data")..'*\n☤ *invate Chat* `:` *'..(InvateChat or "i can't Get Data")..'*\n☤ *Last Seen* `:` *'..(StatusOnline or "i can't Get Data")..'*'

tdbot.editMessageText(msg.chat_id, msg.id, text, 'md', false, 0, nil, nil, nil)
     end
  tdbot.getUserPrivacySettingRules('AllowCalls',getstatuscalls,nil)
end
tdbot.getUserPrivacySettingRules('AllowChatInvites',getstatusinvate,nil)
end
tdbot.getUserPrivacySettingRules('ShowStatus',getonlinestatus,nil)
end
tdbot.getUserPrivacySettingRules('ShowProfilePhoto',getprofilePhoto,nil)
end
tdbot.getUserPrivacySettingRules('ShowLinkInForwardedMessages',getstatus_,nil)

end
users = {}
    username_  = {}
if crco[1] == 'tagall' and is_supergroup(msg) then
    local  text = 'Online users ==> \n'
    getchatMembers = function(add,crco)
    num = crco.total_count
    if num < 2 then
        num_ = 1
    elseif num > 201 then
        num_ = 200
    else
        num_ = num
    end
for number=1,num_ do
    table.insert(users,crco.members[number].user_id)
end

for key, value in pairs(users) do
getusername = function(add,crco_)
    if crco_.username  then
    table.insert(username_,crco_.username)

		 end
        end
tdbot.getUser(value, getusername, nil)
      end
    
    for key, value in pairs(username_) do
    
        text = text.." @"..value.."," 

    end
     tdbot.editMessageText(msg.chat_id, msg.id,text,'html',false, 0, nil, nil, nil)

    end
            tdbot.getSupergroupMembers(msg.chat_id, 'Recent', 0, 200, getchatMembers, nil)
end
if crco[1] == 'help' then
    text = [[
        ☤   Self-Bot   ☤
    *self* _on/off_
    `Enable or Disable Self-Project `

    *texttype* _mention/code/bold/italic/off_
    `Use TEXT TYPE for Message TEXT `

    *markread* _on/off_
    `Enable or Disable MARK READ IN CHAT`

    *readmessage* _on/off_
    `Enable or Disable READ ALL MENTIONS IN CHAT`

    *plugs* 
    `List of Plugs`

    *pl* _-/+  NAME_
    `Enable or Disable Plugs`

    *saveplug* _NAME_
    `Saveing File from` @CRCOPLUGINS `in to plugs`

    *delplug* _NAME_
    `Deleteing Plugins in DISK`

    *setmainbio* _text_ 
    `set MainBio for Time in bio`

    *biotime* _on/off_
    `Enable or Disable start Time in bio`
    
    *private settings*
    `Show Private Settings`

    *tagall*
    `Mention Online Users`

    *clerk* _on/off_
    `Enable or Disable Clerk Mod`

    *setclerk* reply in _gif/videonote/voicenote/text_
    `Set Clerk Return `

    *setenemy* _username/userid/reply_
    `adding user to MOTHER FUCKERS list`

    *delenemy* _username/userid/reply_
    `remove user from mother fuckers list`

    *clean enemylist*
    `clean enemies list`

    *enemylist*
    `Show MotherFuckers in list`  

    *enemymod* _off/on_
    `Enable or Disable Enemy MOD`
    
    *mydel*
    `Del all self message`

    *share* 
    `Share Self Phone number`

    *flood* _number_
    `Flooding in chat by forward message`

    *inv* _username/userid/reply_
    `invate user to chat`

    *kick* _username/userid/reply_
    `banned user from group`

    *ass*
    `Show Ass +18`

    *whois* _userid_
   `Show fully User info`

   *setclerktext* _reply_
   `Text Clerk for caption`

   *mute* _username/userid/reply_
   `Mute user in group`

   *unmute* _username/userid/reply_
   `Unmute user in group`

   *block* _username/userid/reply_
   `Block user in self account`

   *unblock* _username/userid/reply_
   `Unblock user in self account`

   *leave*
   `Left from group`

   *save* _reply_
   `Save file to database`

   *get* _filename_
   `Get file in database by name`

   *files*
   `list of files` 

   *gifset* _cmd_
   `set you'r gif to cmd`

   *gifdel* _cmd_
  `delete gif cmd`

  *gifs*
  `list of gifs cmd`

  *stickerset* _cmd_
  `set you'r sticker to cmd`

  *stickerdel* _cmd_
  `delete sticker cmd`

  *stickers*
 `list of stickers cmd`


    ]]
    return tdbot.editMessageText(msg.chat_id, msg.id,text..SelfVersion,'md',false, 0, nil, nil, nil)

end
if crco[1] == 'setmainbio' then
  
        if crco[2] and (tonumber(string.len(crco[2])) < 71 or tonumber(utf8.len(crco[2])) < 71) then

        save('other','Self-Bio-MAIN',crco[2])
        return tdbot.editMessageText(msg.chat_id, msg.id, 'Message : Main Bio seted  to : '..crco[2],'md',false, 0, nil, nil, nil)
        else 
            return tdbot.editMessageText(msg.chat_id, msg.id, 'Message : please using 70 char in text ','md',false, 0, nil, nil, nil)

    end
end
if crco[1] == 'dump' then 
    function VarDump(CerNer,Company)
    local text = encode_json.encode(Company)

    return tdbot.editMessageText(msg.chat_id, msg.id, text,'html',false, 0, nil, nil, nil)

     end
    if tonumber(msg.reply_to_message_id) == 0 then
    else
    tdbot.getMessage(msg.chat_id, 
    tonumber(msg.reply_to_message_id),VarDump,nil)
    end
    end
if crco[1] == 'biotime' then
    if crco[2] == 'on' then
        biotime = true
    elseif crco[2] == 'off' then
        biotime = nil
    else
        return
    end
    if biotime then
        save('other','Self-Time',true)
        return tdbot.editMessageText(msg.chat_id, msg.id, 'Message : Time in bio has been enabled','md',false, 0, nil, nil, nil)
    else
        del('other','Self-Time')
        return  tdbot.editMessageText(msg.chat_id, msg.id, 'Message : Time in bio Has been Disable','md',false, 0, nil, nil, nil)
    end
end
if crco[1] == 'texttype' then
    if crco[2] == 'code' then
        type_mod = 'code'
    elseif crco[2] == 'mention' then
        type_mod = 'mention'
    elseif crco[2] == 'off' then
   type_mod = nil
    elseif crco[2] == 'bold' then
        type_mod = 'bold'
    elseif crco[2] == 'italic' then 
        type_mod = 'italic'
    else
        return

    end
    if type_mod then
        save('other','TextType',type_mod)
        return tdbot.editMessageText(msg.chat_id, msg.id, 'Message : Text Type seted to '..type_mod..' type !','md',false, 0, nil, nil, nil)
    else
        del('other','TextType')
        return  tdbot.editMessageText(msg.chat_id, msg.id, 'Message : TextType Has been Disable','md',false, 0, nil, nil, nil)
    end
end
end
end
function pre(msg,first_update)
    timenow = os.date("%M")
    if first_update and not Get('for_all','self-off') then
        if Get('other','Self-Time') and Get('other','Self-Bio-MAIN') and  tonumber(timenow) ~= tonumber(Get('other','timezone') or 0)then
            Time = os.date("%H:%M")
             tdbot.setBio(Get('other','Self-Bio-MAIN')..': |'..Time..'|', dl_cb, nil)
             save('other','timezone',timenow)

         end
end

    if msg then
    
    if not Get('for_all','self-off') then
      
             if Get('for_all','markread') then
          tdbot.viewMessages(msg.chat_id, msg.id, 1)
        end
    if Get('other','ReadMessage:'..msg.chat_id) then
         tdbot.readAllChatMentions(msg.chat_id,nil,nil)
                end
    if is_sudo(msg.sender_user_id) then
    if msg.content._ == "messageText" and  msg.content.text.text and tonumber(msg.edit_date) == 0 then
        if Get('other','TextType') and  tonumber(msg.edit_date) == 0  then
    if  Get('other','TextType')  == 'bold' then
         tdbot.editMessageText(msg.chat_id, msg.id, '*'..msg.content.text.text..'*','md',false, 0, nil, nil, nil)
    elseif  Get('other','TextType')  == 'mention' then
    function GETINGUSER(CR,CO)
        if tonumber(CO.edit_date) == 0 and CO.sender_user_id then
        tdbot.editMessageTextMention(msg.chat_id, msg.id, msg.content.text.text,0,utf8.len(msg.content.text.text),CO.sender_user_id)
        else 
        tdbot.editMessageTextMention(msg.chat_id, msg.id, msg.content.text.text,0,utf8.len(msg.content.text.text),bot.id)
        end
        end
     tdbot.getMessage(msg.chat_id, tonumber(msg.reply_to_message_id),GETINGUSER,nil)
    elseif Get('other','TextType')  == 'code' then 
    tdbot.editMessageText(msg.chat_id,msg.id,'`'..msg.content.text.text..'`','md',false, 0, nil, nil, nil)
    elseif Get('other','TextType')  == 'italic' then
         tdbot.editMessageText(msg.chat_id,msg.id,'_'..msg.content.text.text..'_','md',false, 0, nil, nil, nil)
        end
   
end
    end
end
end
end
end
return {
       patterns = pat,
                runing = run ,
                cmd = false,
                lower = false,
            run = pre 
}
