Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E73E12067A
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Dec 2019 13:59:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727599AbfLPM7O (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Dec 2019 07:59:14 -0500
Received: from www262.sakura.ne.jp ([202.181.97.72]:58838 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727553AbfLPM7O (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Dec 2019 07:59:14 -0500
Received: from fsav403.sakura.ne.jp (fsav403.sakura.ne.jp [133.242.250.102])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id xBGCwlAi060893;
        Mon, 16 Dec 2019 21:58:47 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav403.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav403.sakura.ne.jp);
 Mon, 16 Dec 2019 21:58:47 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav403.sakura.ne.jp)
Received: from [192.168.1.9] (softbank126040062084.bbtec.net [126.40.62.84])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id xBGCwiwo060701
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NO);
        Mon, 16 Dec 2019 21:58:46 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [PATCH v2] kconfig: Add yes2modconfig and mod2yesconfig targets.
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>
References: <5a473c6c-cc1f-6648-31ec-3b40e415a836@infradead.org>
 <20191207014238.5507-1-penguin-kernel@I-love.SAKURA.ne.jp>
 <CAK7LNATj5RBHov_w05q1XSiOPN7fYQCKhVMDzHNwHSB1Eq2rmQ@mail.gmail.com>
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <cedbe416-844e-2bb8-5d05-4cd34eae8619@i-love.sakura.ne.jp>
Date:   Mon, 16 Dec 2019 21:58:43 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CAK7LNATj5RBHov_w05q1XSiOPN7fYQCKhVMDzHNwHSB1Eq2rmQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Thank you for reviewing.

On 2019/12/16 20:10, Masahiro Yamada wrote:
> BTW, I have never contributed to the syzbot bug shooting.
> So, please teach me if you know this:
> Is there a a specific reason why the config set for syzbot
> is close to allyesconfig instead of allmodconfig?

I don't know. But I guess that all-in-one vmlinux file is easier to use
(e.g. no need to copy .ko files into initramfs nor /lib/modules/ directory
in the root filesystem image, no need to fetch .ko files when calculating
locations in the source code from kernel addresses, no need to worry about
availability of .ko loader program and request_module() dependency).

>> @@ -669,6 +684,8 @@ int main(int ac, char **av)
>>         case listnewconfig:
>>         case helpnewconfig:
>>         case syncconfig:
>> +       case yes2modconfig:
>> +       case mod2yesconfig:
> 
> This looks like
> yes2mod/mod2yesconfig are interactive modes.
> Why do you need this?
> 
> I believe yes2mod/mod2yesconfig
> should work non-interactively.

I worried that simple s/=y$/=m/ or s/=m$/=y/ on tristate config fails to satisfy
requirement/dependency. And I assumed that

  /* Update until a loop caused no more changes */
  do {
  	conf_cnt = 0;
  	check_conf(&rootmenu);
  } while (conf_cnt);

is the location to make modifications in order to adjust requirement/dependency.
But I might be wrong. I just assumed that we should behave as if "make oldconfig"
after doing simple s/=y$/=m/ or s/=m$/=y/ on tristate config.

Does some later function automatically adjust requirement/dependency ? If yes,

>> @@ -638,6 +648,11 @@ int main(int ac, char **av)
>>                 }
>>         }
>>
>> +       if (input_mode == yes2modconfig)
>> +               conf_rewrite_mod_or_yes(def_y2m);
>> +       else if (input_mode == mod2yesconfig)
>> +               conf_rewrite_mod_or_yes(def_m2y);
>> +
> 
> For consistency, why not put these lines into the switch statement below?

conf_rewrite_mod_or_yes() should be put into the switch statement.

>> diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
>> index 3569d2dec37c..6832a04a1aa4 100644
>> --- a/scripts/kconfig/confdata.c
>> +++ b/scripts/kconfig/confdata.c
>> @@ -1362,3 +1362,29 @@ bool conf_set_all_new_symbols(enum conf_def_mode mode)
>>
>>         return has_changed;
>>  }
>> +
>> +bool conf_rewrite_mod_or_yes(enum conf_def_mode mode)
> 
> If you do not use the return value of this function,
> could you make it into a void function?

OK.

>> +{
>> +       struct symbol *sym;
>> +       int i;
>> +       bool has_changed = false;
>> +
>> +       if (mode == def_y2m) {
>> +               for_all_symbols(i, sym) {
>> +                       if (sym_get_type(sym) == S_TRISTATE &&
>> +                           sym->def[S_DEF_USER].tri == yes) {
>> +                               sym->def[S_DEF_USER].tri = mod;
>> +                               has_changed = true;
> 
> sym_add_change_count(1); seems the convention way
> to inform kconfig of some options being updated.

Then, we can do "sym_add_change_count(1);" instead of "return has_changed;".

