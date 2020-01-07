Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C600C132CBE
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Jan 2020 18:13:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728262AbgAGRNf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 7 Jan 2020 12:13:35 -0500
Received: from terminus.zytor.com ([198.137.202.136]:58861 "EHLO
        mail.zytor.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728211AbgAGRNe (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Jan 2020 12:13:34 -0500
Received: from [IPv6:2601:646:8600:3281:3840:b5ed:cfa7:59d] ([IPv6:2601:646:8600:3281:3840:b5ed:cfa7:59d])
        (authenticated bits=0)
        by mail.zytor.com (8.15.2/8.15.2) with ESMTPSA id 007HDBBO3393366
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
        Tue, 7 Jan 2020 09:13:12 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 007HDBBO3393366
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
        s=2019122001; t=1578417193;
        bh=Dmfwf3/FN4yxJW+5Klfjy5Ddt88R5IwzSu4HDodXyPc=;
        h=Date:In-Reply-To:References:Subject:To:CC:From:From;
        b=gyTzWYfWMQzL1pFR9lx10vccAIf8YZTZjeBZX0C5ViA0KHJl9yJzwUfGqufrZYknP
         hRjDkJeSkc3hEU1cF7cAKdHQp1D7jl7+61siTYUITng8B8gDpwOT1QUjpyOK8HIYZG
         pkUUb77eD589CA2xy6oh63Dv8EomXeseRqxofhBtR0EfcdeaEYlFIN4mQ1U9yUOAS4
         +MvJSkd7S1lwmpYnhk2PUNlQytJMYHIt00/dSMLMc1uee0bmM1eWKHYvt1JMDRYrBh
         CQGtNq7uPC5BhtU5D72/DBvdis/s1yhOU+WkJoh+STBk7Gdr4nYmAOO154bR37fRpr
         v5RXdXA7VmZEA==
Date:   Tue, 07 Jan 2020 09:13:03 -0800
User-Agent: K-9 Mail for Android
In-Reply-To: <CAK7LNAS+SfvRRu=WHzh6eghBNusMiEaxuqj0L+5jnA0W=HOy+Q@mail.gmail.com>
References: <20200104150238.19834-1-masahiroy@kernel.org> <20200104150238.19834-2-masahiroy@kernel.org> <CAK7LNAS+SfvRRu=WHzh6eghBNusMiEaxuqj0L+5jnA0W=HOy+Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 01/13] initramfs: replace klibcdirs in Makefile with FORCE
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
CC:     Andrew Morton <akpm@linux-foundation.org>,
        Greg Thelen <gthelen@google.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ben Hutchings <ben@decadent.org.uk>
From:   hpa@zytor.com
Message-ID: <6D307942-FAB0-48A7-8441-01AECB94D69E@zytor.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On January 7, 2020 2:46:29 AM PST, Masahiro Yamada <masahiroy@kernel=2Eorg>=
 wrote:
>(+CC: Ben Hutchings, H=2E Peter Anvin)
>
>On Sun, Jan 5, 2020 at 12:03 AM Masahiro Yamada <masahiroy@kernel=2Eorg>
>wrote:
>>
>> 'klibcdirs' was added by commit d39a206bc35d ("kbuild: rebuild
>initramfs
>> if content of initramfs changes")=2E If this is just a matter of
>forcing
>> execution of the recipe line, we can replace it with FORCE=2E
>>
>> I do not understand the purpose of
>>
>>    $(deps_initramfs): klibcdirs
>
>
>Perhaps, the 'klibcdirs' target might be intended
>to control the directory descending
>in case klibc is dropped in the kernel tree=2E
>
>Anyway, klibc is built independently
>of Linux kernel, and this 'klibcdirs' target
>is just a no-op stub as far as the kernel tree is concerned=2E
>
>Clean it up=2E
>
>
>> Remove it=2E
>>
>> Signed-off-by: Masahiro Yamada <masahiroy@kernel=2Eorg>
>> ---
>>
>> Changes in v2:
>>   - New patch (I forgot to submit this in v1 series)
>>
>>  usr/Makefile | 6 +-----
>>  1 file changed, 1 insertion(+), 5 deletions(-)
>>
>> diff --git a/usr/Makefile b/usr/Makefile
>> index e6f7cb2f81db=2E=2E55c942da01cd 100644
>> --- a/usr/Makefile
>> +++ b/usr/Makefile
>> @@ -3,9 +3,6 @@
>>  # kbuild file for usr/ - including initramfs image
>>  #
>>
>> -klibcdirs:;
>> -PHONY +=3D klibcdirs
>> -
>>  suffix_y =3D $(subst $\",,$(CONFIG_INITRAMFS_COMPRESSION))
>>  datafile_y =3D initramfs_data=2Ecpio$(suffix_y)
>>  datafile_d_y =3D =2E$(datafile_y)=2Ed
>> @@ -50,13 +47,12 @@ targets :=3D $(datafile_y)
>>  # do not try to update files included in initramfs
>>  $(deps_initramfs): ;
>>
>> -$(deps_initramfs): klibcdirs
>>  # We rebuild initramfs_data=2Ecpio if:
>>  # 1) Any included file is newer than initramfs_data=2Ecpio
>>  # 2) There are changes in which files are included (added or
>deleted)
>>  # 3) If gen_init_cpio are newer than initramfs_data=2Ecpio
>>  # 4) Arguments to gen_initramfs=2Esh changes
>> -$(obj)/$(datafile_y): $(obj)/gen_init_cpio $(deps_initramfs)
>klibcdirs
>> +$(obj)/$(datafile_y): $(obj)/gen_init_cpio $(deps_initramfs) FORCE
>>         $(Q)$(initramfs) -l $(ramfs-input) > $(obj)/$(datafile_d_y)
>>         $(call if_changed,initfs)
>>
>> --
>> 2=2E17=2E1
>>

Yes, it is/was a hook for the klibc integration tree=2E
--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E
