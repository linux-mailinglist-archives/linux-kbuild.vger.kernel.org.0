Return-Path: <linux-kbuild+bounces-7098-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B828BAB609D
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 May 2025 03:57:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D6464A1B7F
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 May 2025 01:57:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E57D1D90A5;
	Wed, 14 May 2025 01:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=underview.tech header.i=@underview.tech header.b="hci7WfB3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DD91D95A9
	for <linux-kbuild@vger.kernel.org>; Wed, 14 May 2025 01:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747187859; cv=none; b=S29/awwIoQ0oSqd8zbCeuZMXvzU6d8c2FmIoHQJSQq67hWYWrMSerZFeTWLywquNcfNVeB31094xgeL4oqqLxN3xOgyp7l7ECE6mm8h40y50AG8FNbEQCK16p/DARD54gjwhnvqaR9GzTAnGL0vtV3nGiM+w1oZ++dn6Lu+zsyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747187859; c=relaxed/simple;
	bh=PbOYyJxUS2wiGt/MPCbNV+4Yebkl6OthwL9anpkhY/Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=QwKLE5Cm9XMuOfdLKwlkycQ7jvbvwPSyfPBpMbOfIJVIxwYaHo5Hgb7b1m/Yvjym8B610/zfNHHkZJzKIww1/FvYjgFANepn65bL37k1gH19PPTfokqCtT1S0/6o3GlGFOh/YoiJzuMW3rDoEFsJSkLF6FPOZQSW9XOv+3Accw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=underview.tech; spf=pass smtp.mailfrom=underview.tech; dkim=pass (2048-bit key) header.d=underview.tech header.i=@underview.tech header.b=hci7WfB3; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=underview.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=underview.tech
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a0bdcd7357so4405029f8f.1
        for <linux-kbuild@vger.kernel.org>; Tue, 13 May 2025 18:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1747187855; x=1747792655; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lgQccsi/W+YlP+qvUVcraV7kfTql/+lwO6oR1mRNmV8=;
        b=hci7WfB3Zrpw40IilhYQmsigljbg6XlG7PA7+cboRgTYQyn8iOOAkSfnqA3ntvqeQ+
         6BvtCKExSmLVI45fidvPg3655VSS4QkosIDAMkestSDGcq44zUtu3OPSO4nPNe47o2wa
         Rsd75Gp3pWAzd9Hi+lW3YgrgKNOW8miRZ9qKxJ1sm2HeMZGIMzGGsgXcMgR/pckP8W2v
         AKvz6Gr+Sw3MZn85XhjNricFW1t9c+hm6P5HvsolW4nA0bJttIqVI/xzf1HBNa7GaPOP
         9u97Y6hVsU1PTWxhBxJEJgn88q2sQOB2+ETEbemr5Ijy2cZ8vYPI8kqg0pIG9art96Q3
         FdvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747187855; x=1747792655;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lgQccsi/W+YlP+qvUVcraV7kfTql/+lwO6oR1mRNmV8=;
        b=XtfHeZ3JZky88I2V8PbJCjJSK/6Cy75f3Aw3M5pSZX26a6y0qE36KmQHDVwybbJwQi
         IsPrMfxnx78Bwf8dste4lIC7L1vggK9V+baKwY6Nc7aCRN64dKEIjf1l5sNuTRqfB5Qv
         uAaxjUqdBdCuKU10P0opalzLGkRTnURIU62oyT1CETU9wBMBcRAZmwLhdr0/btaRFIWc
         d2/ADZdhB/eavZhJjhECg3frqOwF96IiTtDCqKHQ6lMCZu5xTvud71lPBwWbVCexsnJU
         5pmioBip1+BPJEiYqVL6pe6NrRrrIPZtKnDDUYcLUx4Ij1Y6cOCgwmzayEy1Htsvlphn
         jLZw==
X-Gm-Message-State: AOJu0Yw3NwhxmNkd9tzbpefrw2kbuZQMXskYbAs0BzhjTKv3d7+0oUVR
	eWDCMHds/TtbgFyZ8cbuEW6Jgvt1gnOmxFbvRSsvsy4GSVeJB7cTvTGJP1l/19YV0QoE0iKY/nk
	xHxIAa6X3q9cB8GhPNcrjFMXLfoU3t40QvBucyyhIfQ/jEhSlw70=
X-Gm-Gg: ASbGnctPDcAAHRn6Bbh8oN+rVdNRMEa3k/Lnak/NaSwdu6v3eZuHfXsf9ZhQNXRESBt
	PUq7AX9k+FZriBPl3y0mgphgS/AMzf2JUmzREwFNOPmoinkXySdOLpSKh01+Rx6dPCQ53bqencN
	2J9Brgz8ZzB9xrBVnzg7wdIl39vRof7MwPu8i9UywTEOQYt4oJDSfnpm1s/y39Ipg=
X-Google-Smtp-Source: AGHT+IGBoSgda87YL1aWWRU1Zp8n13aZd6BrkhwV90Ccm2wWrFV0Xx2fwX6CRHnVCudwyn2IX3IEbWE+ac55HuA4bR4=
X-Received: by 2002:a5d:47a6:0:b0:3a0:7a5d:96f6 with SMTP id
 ffacd0b85a97d-3a34994bf2dmr1130282f8f.38.1747187855284; Tue, 13 May 2025
 18:57:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513040409.147881-1-vince@underview.tech> <CAK7LNAQw0KH-yaGTYi7Efy-NpkYuC8qyMfB04pq2DkS6FTQkeg@mail.gmail.com>
 <CAPQx_gO-HqcAPES8TGwM=uUNF_OOkNSAi6C8Z5=5K4-ODb9OsQ@mail.gmail.com>
In-Reply-To: <CAPQx_gO-HqcAPES8TGwM=uUNF_OOkNSAi6C8Z5=5K4-ODb9OsQ@mail.gmail.com>
From: Vincent Davis <vince@underview.tech>
Date: Tue, 13 May 2025 21:57:24 -0400
X-Gm-Features: AX0GCFu8wBcolTtJuOmcfhpg5kz6OwW6uLsA4Tu3vs7sqVv2mHeebQBwJndG7rQ
Message-ID: <CAPQx_gOpM0R325YPSFV-8Mq2rx15aF2ObNypn__bBxVbQL_duA@mail.gmail.com>
Subject: Re: [PATCH] Makefile: add KCFLAGS to build with Yocto SDK
To: linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello correction in previous comment.

After SDK extraction, developers have to first prepare the SDK's
kernel source tree to be able to build any out of tree drivers with
the SDK's cross-compilers and kernel source tree.

Thanks,
Vincent

On Tue, May 13, 2025 at 9:47=E2=80=AFPM Vincent Davis <vince@underview.tech=
> wrote:
>
> Hello,
>
> Sorry I should have given a better description. First kernel patch.
>
> There appears to be a userspace program called fixdep.c.
> That won't compile when you utilize the yocto project SDK
> cross compilers. Problems are described in the original patch.
>
> We have to run make modules_prepare as there's limits with the
> Yocto project kernel-devsrc package that gets included in the SDK.
>
> After SDK extraction, developers have to first prepare the SDK's
> kernel source tree to be able to build any out of tree drivers with
> the SDK's cross-compilers. This wasn't achievable without the
> submitted patch.
>
> Sorry for poor timing. I am going on vacation and can't respond
> due to emails needing to be in plain text. Please don't ignore
> future patches.
>
> For instance if I run bellow commands
>
> $ ./x86_64-0.1.0-underview.sh
> Underview SDK installer version 0.1.0
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Enter target directory for SDK (default: .): extract-sdk
> You are about to install the SDK to "/home/vince/extract-sdk". Proceed [Y=
/n]? Y
> Extracting SDK...........................................................=
...........................................................................=
...........................................................................=
...........................................................................=
.................................................done
> Setting it up...done
> SDK has been successfully set up and is ready to be used.
> Each time you wish to use the SDK in a new shell session, you need to
> source the environment setup script e.g.
>  $ . /home/vince/extract-sdk/environment-setup-zen1-underview-linux
>
>  $ source /home/vince/extract-sdk/environment-setup-zen1-underview-linux
>
> $ cd /home/vince/extract-sdk
>  $ ls sysroots/zen1-underview-linux/usr/lib/modules/6.6.9-amd-standard/bu=
ild/
> arch   certs   Documentation  fs       init      ipc     Kconfig  lib
>      mm              net   samples  security
> System.map-6.6.9-amd-standard  usr
> block  crypto  drivers        include  io_uring  Kbuild  kernel
> Makefile  Module.symvers  rust  scripts  sound     tools
>            virt
>
>  $ make -C sysroots/zen1-underview-linux/usr/lib/modules/6.6.9-amd-standa=
rd/build
> modules_prepare
> make: Entering directory
> '/home/vince/extract-sdk/sysroots/zen1-underview-linux/usr/lib/modules/6.=
6.9-amd-standard/build'
>   SYNC    include/config/auto.conf
>   HOSTCC  scripts/basic/fixdep
> scripts/basic/fixdep.c:92:10: fatal error: sys/types.h: No such file
> or directory
>    92 | #include <sys/types.h>
>       |          ^~~~~~~~~~~~~
> compilation terminated.
> make[3]: *** [scripts/Makefile.host:114: scripts/basic/fixdep] Error 1
> make[2]: *** [Makefile:633: scripts_basic] Error 2
> make[1]: *** [/home/vince/extract-sdk/sysroots/zen1-underview-linux/usr/l=
ib/modules/6.6.9-amd-standard/build/Makefile:798:
> include/config/auto.conf] Error 2
> make[1]: *** [include/config/auto.conf] Deleting file
> 'include/generated/rustc_cfg'
> make[1]: *** [include/config/auto.conf] Deleting file
> 'include/generated/autoconf.h'
> make: *** [Makefile:234: __sub-make] Error 2
> make: Leaving directory
> '/home/vince/extract-sdk/sysroots/zen1-underview-linux/usr/lib/modules/6.=
6.9-amd-standard/build'
>
> Hopefully makes sense
>
>
> On Tue, May 13, 2025 at 10:39=E2=80=AFAM Masahiro Yamada <masahiroy@kerne=
l.org> wrote:
> >
> > On Tue, May 13, 2025 at 1:04=E2=80=AFPM Vincent Davis Jr <vince@undervi=
ew.tech> wrote:
> > >
> > > When running
> > >
> > > make -C \
> > > "${SDKTARGETSYSROOT}/lib/modules/<kernel version>/build" \
> > > modules_prepare
> >
> > This is not the correct way to build an external module.
> > Do not run modules_prepare.
> >
> >
> >
> >
> > > Issue that are encountered include
> > >
> > > make -f ./Makefile syncconfig
> > > make -f ./scripts/Makefile.build obj=3Dscripts/basic
> > >    92 | #include <sys/types.h>
> > >       |          ^~~~~~~~~~~~~
> > > compilation terminated.
> > >
> > > ld: cannot find Scrt1.o: No such file or directory
> > > ld: cannot find crti.o: No such file or directory
> > > ld: cannot find crtbeginS.o: No such file or directory
> > > ld: cannot find -lgcc: No such file or directory
> > > ld: cannot find -lgcc_s: No such file or directory
> > > ld: cannot find -lc: No such file or directory
> > > ld: cannot find -lgcc: No such file or directory
> > > ld: cannot find -lgcc_s: No such file or directory
> > > ld: cannot find crtendS.o: No such file or directory
> > > ld: cannot find crtn.o: No such file or directory
> > >
> > > Solved by setting KCFLAGS as the yocto project SDK
> > > KCFLAGS is set to --sysroot=3D"${SDKTARGETSYSROOT}".
> > >
> > > Signed-off-by: Vincent Davis Jr <vince@underview.tech>
> > > ---
> > >  Makefile | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/Makefile b/Makefile
> > > index 64c514f4bc19..bbe7b0503841 100644
> > > --- a/Makefile
> > > +++ b/Makefile
> > > @@ -459,7 +459,7 @@ HOSTRUSTC =3D rustc
> > >  HOSTPKG_CONFIG =3D pkg-config
> > >
> > >  KBUILD_USERHOSTCFLAGS :=3D -Wall -Wmissing-prototypes -Wstrict-proto=
types \
> > > -                        -O2 -fomit-frame-pointer -std=3Dgnu11
> > > +                        -O2 -fomit-frame-pointer -std=3Dgnu11 $(KCFL=
AGS)
> >
> >
> > Sorry, I do not understand what you are trying to achieve.
> >
> > KCFLAGS is meant to specify compiler flags for the kernel-space,
> > not userspace host programs.
> >
> >
> >
> >
> > >  KBUILD_USERCFLAGS  :=3D $(KBUILD_USERHOSTCFLAGS) $(USERCFLAGS)
> > >  KBUILD_USERLDFLAGS :=3D $(USERLDFLAGS)
> > >
> > > @@ -491,7 +491,7 @@ KBUILD_HOSTCXXFLAGS :=3D -Wall -O2 $(HOST_LFS_CFL=
AGS) $(HOSTCXXFLAGS) \
> > >                        -I $(srctree)/scripts/include
> > >  KBUILD_HOSTRUSTFLAGS :=3D $(rust_common_flags) -O -Cstrip=3Ddebuginf=
o \
> > >                         -Zallow-features=3D $(HOSTRUSTFLAGS)
> > > -KBUILD_HOSTLDFLAGS  :=3D $(HOST_LFS_LDFLAGS) $(HOSTLDFLAGS)
> > > +KBUILD_HOSTLDFLAGS  :=3D $(HOST_LFS_LDFLAGS) $(HOSTLDFLAGS) $(KCFLAG=
S)
> > >  KBUILD_HOSTLDLIBS   :=3D $(HOST_LFS_LIBS) $(HOSTLDLIBS)
> > >  KBUILD_PROCMACROLDFLAGS :=3D $(or $(PROCMACROLDFLAGS),$(KBUILD_HOSTL=
DFLAGS))
> > >
> > > --
> > > 2.43.0
> > >
> >
> >
> > --
> > Best Regards
> > Masahiro Yamada

