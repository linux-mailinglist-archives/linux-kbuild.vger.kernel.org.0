Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17B27EEB24
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Nov 2019 22:32:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728377AbfKDVbi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 4 Nov 2019 16:31:38 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58516 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728741AbfKDVbi (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 4 Nov 2019 16:31:38 -0500
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 9831F81F01
        for <linux-kbuild@vger.kernel.org>; Mon,  4 Nov 2019 21:31:37 +0000 (UTC)
Received: by mail-qk1-f200.google.com with SMTP id l21so2131466qke.21
        for <linux-kbuild@vger.kernel.org>; Mon, 04 Nov 2019 13:31:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=odBYYPB2dwXjXn5RBPYq4Rzo0JDyXN/FBfk/mj5Z+EQ=;
        b=De+5LK3TZ09VoXJnbl8rlGzkhUYsRuVdMYoUOssUOE31eqv792umriWJGxN9XBnyMC
         cQ8dPqSUXVLcjSFuoc1Hvuq2sEHaRevq5VRAok/gQwVuH6f5DnmKMIDncwssQHFPW6em
         H36h406DiDvV3E+nhyL7Cbn5F53AQOr5n0KV4F5GfovCFTYNUIpqx+oVdSSNCS9IOEhg
         Pq0WajABhpwFVxKpYQtW0lahvAITrBRgDOWVFhcp67QGoH/qyBz++tQdoT5CJ550eMvg
         RjXANLx8io2GqCPls+On3dXbDzi4fVQx8n2X0Bpyv46p4ElgpP0dzZdchFhH/6OdanFt
         xLUA==
X-Gm-Message-State: APjAAAUC3USbRUV9TjlF7UIqS4lduPuwXoyTmPYwgTX8NGh4fb0+d1e2
        PwR69rJZZhYXsHc1Dp38Ca4pKT31hg2RqAqV2nKodDhx5+qOHBb5k/bwtCmeTucXK+l3rSfGAjL
        LdM4diw+mEwME52XcYLBaZ+BL
X-Received: by 2002:a0c:94fb:: with SMTP id k56mr24684048qvk.127.1572903096309;
        Mon, 04 Nov 2019 13:31:36 -0800 (PST)
X-Google-Smtp-Source: APXvYqxCaLFc7g2Jbkr2kxfKOHZxG4CVScikJchrj/BxFvo2Kw/4kx1PfGW0DIQYm2b/95qkX5y88g==
X-Received: by 2002:a0c:94fb:: with SMTP id k56mr24684020qvk.127.1572903095923;
        Mon, 04 Nov 2019 13:31:35 -0800 (PST)
Received: from [192.168.1.157] (pool-96-235-39-235.pitbpa.fios.verizon.net. [96.235.39.235])
        by smtp.gmail.com with ESMTPSA id i75sm9718319qke.22.2019.11.04.13.31.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2019 13:31:35 -0800 (PST)
Subject: Re: [RFC PATCH] kconfig: Add option to get the full help text with
 listnewconfig
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jeremy Cline <jcline@redhat.com>,
        Don Zickus <dzickus@redhat.com>
References: <20191029181702.21460-1-labbott@redhat.com>
 <CAK7LNAQV2X94rQP4exP8Kujjm-6FAt_pHoGF6dtHx5qZgAWDxg@mail.gmail.com>
From:   Laura Abbott <labbott@redhat.com>
Message-ID: <070517f0-6394-ede5-f7c2-f0e4552f5088@redhat.com>
Date:   Mon, 4 Nov 2019 16:31:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAK7LNAQV2X94rQP4exP8Kujjm-6FAt_pHoGF6dtHx5qZgAWDxg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 11/3/19 9:20 PM, Masahiro Yamada wrote:
> On Wed, Oct 30, 2019 at 3:17 AM Laura Abbott <labbott@redhat.com> wrote:
>>
>> make listnewconfig will list the individual options that need to be set.
>> This is useful but there's no easy way to get the help text associated
>> with the options at the same time. Introduce a new targe
>> 'make extendedlistnewconfig' which lists the full help text of all the
>> new options as well. This makes it easier to automatically generate
>> changes that are easy for humans to review. This command also adds
>> markers between each option for easier parsing.
>>
>> Signed-off-by: Laura Abbott <labbott@redhat.com>
>> ---
>> Red Hat has been relying on some external libraries that have a tendency
>> to break to get the help text for all new config options. I'd really
>> like an in tree way to get the help text so we can automatically
>> generate patches for people to reveiw new config options. I'm open to
>> other approaches that let us script getting the help text as well.
> 
> I am not familiar with the workflow in Red Hat.
> I cannot propose another approach.
> 
> 
> I am not a big fan of the target name.
> 'extendedlistnewconfig' is so long that it breaks the
> alignment of 'make help'.
> Maybe 'helpnewconfig' is understandable
> although I am open to discussion for a better name.
> 
> 

Yes, I agree the name is long. helpnewconfig is fine by me.

> BTW, did you check how the newly-added 'choice' was displayed?
> Its help message is displayed, but the choice has no name.
> So, people might be confused what the help message is talking about.
> 
> 

Thanks for pointing this out. For what we're looking to do I
think we can work around it.

Thanks,
Laura

> 
> 
>> ---
>>   scripts/kconfig/Makefile |  5 ++++-
>>   scripts/kconfig/conf.c   | 13 ++++++++++++-
>>   2 files changed, 16 insertions(+), 2 deletions(-)
>>
>> diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
>> index ef2f2336c469..aaaf1f62300c 100644
>> --- a/scripts/kconfig/Makefile
>> +++ b/scripts/kconfig/Makefile
>> @@ -66,7 +66,9 @@ localyesconfig localmodconfig: $(obj)/conf
>>   #  syncconfig has become an internal implementation detail and is now
>>   #  deprecated for external use
>>   simple-targets := oldconfig allnoconfig allyesconfig allmodconfig \
>> -       alldefconfig randconfig listnewconfig olddefconfig syncconfig
>> +       alldefconfig randconfig listnewconfig olddefconfig syncconfig \
>> +       extendedlistnewconfig
>> +
>>   PHONY += $(simple-targets)
>>
>>   $(simple-targets): $(obj)/conf
>> @@ -134,6 +136,7 @@ help:
>>          @echo  '  alldefconfig    - New config with all symbols set to default'
>>          @echo  '  randconfig      - New config with random answer to all options'
>>          @echo  '  listnewconfig   - List new options'
>> +       @echo  '  extendedlistnewconfig   - List new options'
>>          @echo  '  olddefconfig    - Same as oldconfig but sets new symbols to their'
>>          @echo  '                    default value without prompting'
>>          @echo  '  kvmconfig       - Enable additional options for kvm guest kernel support'
>> diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
>> index 40e16e871ae2..7aeb77374d9a 100644
>> --- a/scripts/kconfig/conf.c
>> +++ b/scripts/kconfig/conf.c
>> @@ -32,6 +32,7 @@ enum input_mode {
>>          defconfig,
>>          savedefconfig,
>>          listnewconfig,
>> +       extendedlistnewconfig,
>>          olddefconfig,
>>   };
>>   static enum input_mode input_mode = oldaskconfig;
>> @@ -434,6 +435,11 @@ static void check_conf(struct menu *menu)
>>                                                  printf("%s%s=%s\n", CONFIG_, sym->name, str);
>>                                          }
>>                                  }
>> +                       } else if (input_mode == extendedlistnewconfig) {
>> +                               printf("-----\n");
>> +                               print_help(menu);
>> +                               printf("-----\n");
>> +
>>                          } else {
>>                                  if (!conf_cnt++)
>>                                          printf("*\n* Restart config...\n*\n");
>> @@ -459,6 +465,7 @@ static struct option long_opts[] = {
>>          {"alldefconfig",    no_argument,       NULL, alldefconfig},
>>          {"randconfig",      no_argument,       NULL, randconfig},
>>          {"listnewconfig",   no_argument,       NULL, listnewconfig},
>> +       {"extendedlistnewconfig",   no_argument,       NULL, extendedlistnewconfig},
>>          {"olddefconfig",    no_argument,       NULL, olddefconfig},
>>          {NULL, 0, NULL, 0}
>>   };
>> @@ -469,6 +476,7 @@ static void conf_usage(const char *progname)
>>          printf("Usage: %s [-s] [option] <kconfig-file>\n", progname);
>>          printf("[option] is _one_ of the following:\n");
>>          printf("  --listnewconfig         List new options\n");
>> +       printf("  --extendedlistnewconfig List new options and help text\n");
>>          printf("  --oldaskconfig          Start a new configuration using a line-oriented program\n");
>>          printf("  --oldconfig             Update a configuration using a provided .config as base\n");
>>          printf("  --syncconfig            Similar to oldconfig but generates configuration in\n"
>> @@ -543,6 +551,7 @@ int main(int ac, char **av)
>>                  case allmodconfig:
>>                  case alldefconfig:
>>                  case listnewconfig:
>> +               case extendedlistnewconfig:
>>                  case olddefconfig:
>>                          break;
>>                  case '?':
>> @@ -576,6 +585,7 @@ int main(int ac, char **av)
>>          case oldaskconfig:
>>          case oldconfig:
>>          case listnewconfig:
>> +       case extendedlistnewconfig:
>>          case olddefconfig:
>>                  conf_read(NULL);
>>                  break;
>> @@ -657,6 +667,7 @@ int main(int ac, char **av)
>>                  /* fall through */
>>          case oldconfig:
>>          case listnewconfig:
>> +       case extendedlistnewconfig:
>>          case syncconfig:
>>                  /* Update until a loop caused no more changes */
>>                  do {
>> @@ -675,7 +686,7 @@ int main(int ac, char **av)
>>                                  defconfig_file);
>>                          return 1;
>>                  }
>> -       } else if (input_mode != listnewconfig) {
>> +       } else if (input_mode != listnewconfig && input_mode != extendedlistnewconfig) {
>>                  if (!no_conf_write && conf_write(NULL)) {
>>                          fprintf(stderr, "\n*** Error during writing of the configuration.\n\n");
>>                          exit(1);
>> --
>> 2.21.0
>>
> 
> 

