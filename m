Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B60E28C0ED
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Oct 2020 21:08:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390466AbgJLTHn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 12 Oct 2020 15:07:43 -0400
Received: from esgaroth.petrovitsch.at ([78.47.184.11]:2444 "EHLO
        esgaroth.tuxoid.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390483AbgJLTD0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Oct 2020 15:03:26 -0400
X-Greylist: delayed 464 seconds by postgrey-1.27 at vger.kernel.org; Mon, 12 Oct 2020 15:03:23 EDT
Received: from [10.68.100.236] (h10-gesig.woeg.acw.at [217.116.178.11] (may be forged))
        (authenticated bits=0)
        by esgaroth.tuxoid.at (8.15.2/8.15.2) with ESMTPSA id 09CIsXfE004912
        (version=TLSv1 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO);
        Mon, 12 Oct 2020 20:54:34 +0200
Subject: Re: [PATCH v2 2/2] kbuild: use interpreters to invoke scripts
To:     Ujjwal Kumar <ujjwalkumar0501@gmail.com>
Cc:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <20201012170631.1241502-1-ujjwalkumar0501@gmail.com>
 <20201012170631.1241502-3-ujjwalkumar0501@gmail.com>
 <alpine.DEB.2.21.2010122019410.17866@felia>
 <b4fdc7c5-8edf-3895-69fc-1bcf9efb5d4a@gmail.com>
From:   Bernd Petrovitsch <bernd@petrovitsch.priv.at>
X-Pep-Version: 2.0
Message-ID: <53b7257e-b192-07da-9dd3-06497ce826f0@petrovitsch.priv.at>
Date:   Mon, 12 Oct 2020 18:54:30 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b4fdc7c5-8edf-3895-69fc-1bcf9efb5d4a@gmail.com>
Content-Type: multipart/mixed;
 boundary="------------D9D31DCEC171E15EB310C0FA"
Content-Language: en-US
X-DCC--Metrics: esgaroth.tuxoid.at 1481; Body=14 Fuz1=14 Fuz2=14
X-Virus-Scanned: clamav-milter 0.97 at esgaroth.tuxoid.at
X-Virus-Status: Clean
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED
        autolearn=unavailable version=3.3.1
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on esgaroth.tuxoid.at
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This is a multi-part message in MIME format.
--------------D9D31DCEC171E15EB310C0FA
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi all!

On 12/10/2020 18:42, Ujjwal Kumar wrote:
> On 12/10/20 11:50 pm, Lukas Bulwahn wrote:
>>
>>
>> On Mon, 12 Oct 2020, Ujjwal Kumar wrote:
>>
>>> We cannot rely on execute bits to be set on files in the repository.
>>> The build script should use the explicit interpreter when invoking an=
y
>>> script from the repository.
>>>
>>> Link: https://lore.kernel.org/lkml/20200830174409.c24c3f67addcce0cea9=
a9d4c@linux-foundation.org/
>>> Link: https://lore.kernel.org/lkml/202008271102.FEB906C88@keescook/
>>>
>>> Suggested-by: Andrew Morton <akpm@linux-foundation.org>
>>> Suggested-by: Kees Cook <keescook@chromium.org>
>>> Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
>>> Signed-off-by: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
>>> ---
>>>  Makefile                          | 4 ++--
>>>  arch/arm64/kernel/vdso/Makefile   | 2 +-
>>>  arch/arm64/kernel/vdso32/Makefile | 2 +-
>>>  arch/ia64/Makefile                | 4 ++--
>>>  arch/nds32/kernel/vdso/Makefile   | 2 +-
>>>  scripts/Makefile.build            | 2 +-
>>>  scripts/Makefile.package          | 4 ++--
>>>  7 files changed, 10 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/Makefile b/Makefile
>>> index 0af7945caa61..df20e71dd7c8 100644
>>> --- a/Makefile
>>> +++ b/Makefile
>>> @@ -1256,7 +1256,7 @@ include/generated/utsrelease.h: include/config/=
kernel.release FORCE
>>>  PHONY +=3D headerdep
>>>  headerdep:
>>>  	$(Q)find $(srctree)/include/ -name '*.h' | xargs --max-args 1 \
>>> -	$(srctree)/scripts/headerdep.pl -I$(srctree)/include
>>> +	$(PERL) $(srctree)/scripts/headerdep.pl -I$(srctree)/include
>>>
>>>  # ------------------------------------------------------------------=
---------
>>>  # Kernel headers
>>> @@ -1312,7 +1312,7 @@ PHONY +=3D kselftest-merge
>>>  kselftest-merge:
>>>  	$(if $(wildcard $(objtree)/.config),, $(error No .config exists, co=
nfig your kernel first!))
>>>  	$(Q)find $(srctree)/tools/testing/selftests -name config | \
>>> -		xargs $(srctree)/scripts/kconfig/merge_config.sh -m $(objtree)/.co=
nfig
>>> +		xargs $(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh -=
m $(objtree)/.config
>>>  	$(Q)$(MAKE) -f $(srctree)/Makefile olddefconfig
>>>
>>>  # ------------------------------------------------------------------=
---------
>>> diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso=
/Makefile
>>> index edccdb77c53e..fb07804b7fc1 100644
>>> --- a/arch/arm64/kernel/vdso/Makefile
>>> +++ b/arch/arm64/kernel/vdso/Makefile
>>> @@ -65,7 +65,7 @@ $(obj)/%.so: $(obj)/%.so.dbg FORCE
>>>  # Generate VDSO offsets using helper script
>>>  gen-vdsosym :=3D $(srctree)/$(src)/gen_vdso_offsets.sh
>>>  quiet_cmd_vdsosym =3D VDSOSYM $@
>>> -      cmd_vdsosym =3D $(NM) $< | $(gen-vdsosym) | LC_ALL=3DC sort > =
$@
>>> +      cmd_vdsosym =3D $(NM) $< | $(CONFIG_SHELL) $(gen-vdsosym) | LC=
_ALL=3DC sort > $@
>>>
>>>  include/generated/vdso-offsets.h: $(obj)/vdso.so.dbg FORCE
>>>  	$(call if_changed,vdsosym)
>>> diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vd=
so32/Makefile
>>> index 7f96a1a9f68c..617c9ac58156 100644
>>> --- a/arch/arm64/kernel/vdso32/Makefile
>>> +++ b/arch/arm64/kernel/vdso32/Makefile
>>> @@ -205,7 +205,7 @@ quiet_cmd_vdsomunge =3D MUNGE   $@
>>>  gen-vdsosym :=3D $(srctree)/$(src)/../vdso/gen_vdso_offsets.sh
>>>  quiet_cmd_vdsosym =3D VDSOSYM $@
>>>  # The AArch64 nm should be able to read an AArch32 binary
>>> -      cmd_vdsosym =3D $(NM) $< | $(gen-vdsosym) | LC_ALL=3DC sort > =
$@
>>> +      cmd_vdsosym =3D $(NM) $< | $(CONFIG_SHELL) $(gen-vdsosym) | LC=
_ALL=3DC sort > $@
>>>
>>>  # Install commands for the unstripped file
>>>  quiet_cmd_vdso_install =3D INSTALL32 $@
>>> diff --git a/arch/ia64/Makefile b/arch/ia64/Makefile
>>> index 703b1c4f6d12..86d42a2d09cb 100644
>>> --- a/arch/ia64/Makefile
>>> +++ b/arch/ia64/Makefile
>>> @@ -27,8 +27,8 @@ cflags-y	:=3D -pipe $(EXTRA) -ffixed-r13 -mfixed-ra=
nge=3Df12-f15,f32-f127 \
>>>  		   -falign-functions=3D32 -frename-registers -fno-optimize-sibling=
-calls
>>>  KBUILD_CFLAGS_KERNEL :=3D -mconstant-gp
>>>
>>> -GAS_STATUS	=3D $(shell $(srctree)/arch/ia64/scripts/check-gas "$(CC)=
" "$(OBJDUMP)")
>>> -KBUILD_CPPFLAGS +=3D $(shell $(srctree)/arch/ia64/scripts/toolchain-=
flags "$(CC)" "$(OBJDUMP)" "$(READELF)")
>>> +GAS_STATUS	=3D $(shell $(CONFIG_SHELL) $(srctree)/arch/ia64/scripts/=
check-gas "$(CC)" "$(OBJDUMP)")
>>> +KBUILD_CPPFLAGS +=3D $(shell $(CONFIG_SHELL) $(srctree)/arch/ia64/sc=
ripts/toolchain-flags "$(CC)" "$(OBJDUMP)" "$(READELF)")
>>
>> Here is an instance of what Masahiro-san pointed out being wrong.
>>
>> Ujjwal, will you send a v3?
>=20
> Following is the quoted text from the reply mail from Masahiro
>=20
>>> -GAS_STATUS     =3D $(shell $(srctree)/arch/ia64/scripts/check-gas "$=
(CC)" "$(OBJDUMP)")
>>> -KBUILD_CPPFLAGS +=3D $(shell $(srctree)/arch/ia64/scripts/toolchain-=
flags "$(CC)" "$(OBJDUMP)" "$(READELF)")
>>> +GAS_STATUS     =3D $($(CONFIG_SHELL) $(srctree)/arch/ia64/scripts/ch=
eck-gas "$(CC)" "$(OBJDUMP)")
>>> +KBUILD_CPPFLAGS +=3D $($(CONFIG_SHELL) $(srctree)/arch/ia64/scripts/=
toolchain-flags "$(CC)" "$(OBJDUMP)" "$(READELF)")
>>
>>
>>
>> These changes look wrong to me.
>>
>> $($(CONFIG_SHELL)    ->  $(shell $(CONFIG_SHELL)
>>
>=20
> From the above text, I understand as follows:

Did you actually *test* that (expecially) these lines work
afterwards as good as before?

> That my proposed change:
> $(shell $(src...)    ->  $($(CONFIG_SHELL) $(src...)
>=20
> is WRONG

Yup, as it's in a Makefile and that's a Makefile construct.

> and in the next line he suggested the required correction.
> That being:
> $($(CONFIG_SHELL)    ->  $(shell $(CONFIG_SHELL)

Such stuff should generally not be needed as the to-be-used
shell can be set in Makefiles via a "SHELL =3D " assignment
(defaulting to /bin/sh - what else;-).
Flags for the shell can BTW set with ".SHELLFLAGS =3D ".

So please
-) learn basic "Makefile" + "make" before brainlessly patching
   a Makefile.
-) actually testy your changes to make sure the patch didn't
   broke anything
-) and - last but not least - check if there isn't a shell
   already set (and which).

MfG,
	Bernd
--=20
There is no cloud, just other people computers.
-- https://static.fsf.org/nosvn/stickers/thereisnocloud.svg

--------------D9D31DCEC171E15EB310C0FA
Content-Type: application/pgp-keys;
 name="pEpkey.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="pEpkey.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
lyN9df2R4qM7JHa5IGK2t9DC65Ur+0E7EEckVQ=3D=3D
=3DOPxp
-----END PGP PUBLIC KEY BLOCK-----

--------------D9D31DCEC171E15EB310C0FA--
