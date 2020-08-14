Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 701402449BB
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Aug 2020 14:28:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726313AbgHNM2d (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 14 Aug 2020 08:28:33 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:55521 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728127AbgHNM2V (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 14 Aug 2020 08:28:21 -0400
X-Originating-IP: 93.0.49.108
Received: from [192.168.1.34] (108.49.0.93.rev.sfr.net [93.0.49.108])
        (Authenticated sender: maxime.chretien@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 0652620009;
        Fri, 14 Aug 2020 12:28:14 +0000 (UTC)
From:   Maxime Chretien <maxime.chretien@bootlin.com>
Subject: Re: [PATCH] kconfig qconf: Add grey background for hidden options
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200708133015.12286-1-maxime.chretien@bootlin.com>
 <CAK7LNASpZ=By_-5KKps_q3emHuLBNv7AneLh9eNwBqbZToivSA@mail.gmail.com>
Message-ID: <889cd38e-8c70-f359-c2ca-c63911bec601@bootlin.com>
Date:   Fri, 14 Aug 2020 14:28:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAK7LNASpZ=By_-5KKps_q3emHuLBNv7AneLh9eNwBqbZToivSA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: fr
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 07/08/2020 15:54, Masahiro Yamada wrote:
> On Wed, Jul 8, 2020 at 10:30 PM Maxime Chretien
> <maxime.chretien@bootlin.com>  wrote:
>> This is useful to see which configuration parameters can be edited
>> or not when "Show All Options" is enabled.
>>
>> Signed-off-by: Maxime Chretien<maxime.chretien@bootlin.com>
>> ---
>>   scripts/kconfig/qconf.cc | 7 +++++++
>>   scripts/kconfig/qconf.h  | 4 ++++
>>   2 files changed, 11 insertions(+)
> I like the idea, but
> maybe this patch could be improved?
>
> For example, in the following test code,
> BAR is correctly painted grey when CONFIG_FOO=n,
> but "my menu" is always white despite of
> "depends on FOO"
>
> ----(test code)------
>
> config FOO
>         bool "foo"
>
> config BAR
>         bool "bar"
>         depends on FOO
>
> menu "my menu"
>         depends on FOO
>
> endmenu
>
> -------(test code end)----


It could probably be improved.
Maybe the "visible" state of the menu can be changed
or maybe we should use another element in the test
to grey out menus that needs to be greyed out.


>> diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
>> index c0ac8f7b5f1a..be9ff4651da1 100644
>> --- a/scripts/kconfig/qconf.cc
>> +++ b/scripts/kconfig/qconf.cc
>> @@ -208,6 +208,13 @@ void ConfigItem::updateMenu(void)
>>          }
>>          if (!sym_has_value(sym) && visible)
>>                  prompt += " (NEW)";
>> +
>> +       if(!visible) {
>> +               setBackground(promptColIdx, QBrush(QColor("#E0E0E0")));
>> +       } else {
>> +               setBackground(promptColIdx, QBrush());
>> +       }
>> +
> I think all the columns should be grey-grounded.
> Please note you can click other columns to
> toggle y/m/n.
>
>
> How about something like this?
>
>
>
> QBrush brush;
>
> if (visible)
>          brush = QBrush()
> else
>          brush = QBrush(QColor("#E0E0E0"));
>
> setBackground(promptColIdx, brush);
> setBackground(nameColIdx, brush);
> setBackground(noColIdx, brush);
> setBackground(modColIdx, brush);
> setBackground(yesColIdx, brush);
> setBackground(dataColIdx, brush);


Yes I agree should be better like that so that we can
see what's grey or not even if we have scrolled far
from the first column.


>
>
>>   set_prompt:
>>          setText(promptColIdx, prompt);
>>   }
>> diff --git a/scripts/kconfig/qconf.h b/scripts/kconfig/qconf.h
>> index c879d79ce817..79e47e8c1ae7 100644
>> --- a/scripts/kconfig/qconf.h
>> +++ b/scripts/kconfig/qconf.h
>> @@ -174,6 +174,10 @@ class ConfigItem : public QTreeWidgetItem {
>>          {
>>                  return Parent::text(idx);
>>          }
>> +       void setBackground(colIdx idx, const QBrush& brush)
>> +       {
>> +               Parent::setBackground(idx, brush);
>> +       }
> I do not understand why this wrapper is useful...
>


Well we need to use "Parent" to have access to the "setBackground" function
and I thought it was the way to use it has it's done with "setPixmap" 
just under it.

Maybe there is a better way to do that, I'm a beginner in linux development
so I'm not totally aware of all the rules and ways to add new things.


>>          void setPixmap(colIdx idx, const QIcon &icon)
>>          {
>>                  Parent::setIcon(idx, icon);
>> --
>> 2.27.0
>>


Thanks for reviewing this.

Best regards
Maxime Chretien
