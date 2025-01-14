Return-Path: <linux-kbuild+bounces-5478-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CA9A106C5
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Jan 2025 13:37:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F42011887FA8
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Jan 2025 12:37:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B696236A75;
	Tue, 14 Jan 2025 12:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a6a7VMM9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB66F236A71
	for <linux-kbuild@vger.kernel.org>; Tue, 14 Jan 2025 12:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736858200; cv=none; b=QVxBHw9o17hTuIQa6LvfW7+EDS/0hX/9bcjPm0vzjITbj2Zk1Gkfag1iFAAUTpORo1Kp4MGCBk2vsrlLqNBs9XljyEdeyv8MFaVZ2OV8wlMB2eaNgKwMBJM319wRDKG0Orfa6XMmMYpANCGPNWre6ILcW76IUMEUbZSXsmtC7Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736858200; c=relaxed/simple;
	bh=eooBL5xoufbvq7ajAEcge2Ti/77l/jwO4nPMxp3t0cs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f5j8MoZig9nc2g6e24zduADV7q8KSus4UNZ2KoXugI1jmaPysTMszoJWHM4YukP/pbUtYLNoQrZoLpu1slfuZud9aUUBv+scfROBDOXaGFXVvfugStJ40AkZPwtxWwkVcSxxPKMdGIiMuiUnhqY2Ue2j6rd4PZdnabBrldr71B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a6a7VMM9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93A97C4CEE4
	for <linux-kbuild@vger.kernel.org>; Tue, 14 Jan 2025 12:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736858199;
	bh=eooBL5xoufbvq7ajAEcge2Ti/77l/jwO4nPMxp3t0cs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=a6a7VMM9sQ1BC3JOlPq+B7vHiWQPgCYzJcuT6kSzmjDjcooBr8YUS/bxEv8ePPWUg
	 tyFuRQtWof80kLHZiqvwsX1Tsaz4bMse9Xg28PLdmgwcFqJujtrhxLopJFbm8KAkoP
	 MZ2xr5S1/uW3GOfX5C7qFJ6DK0EwxGzZi9tIx4wJuPB2dI/uqraVtkU/Z1JQEqWaHe
	 v2dhmxzkPGJFXwnjevTb1jn1jFE+KZ3WTqOCrDPP6x8yPkmSNuSPSHeVY4KV705ZUa
	 hVvrofATsdXZvisIWlftOvnVEwbtzqWk8z63wrC1h4vN5zlMtz3MmMqQYFl6DXuMZA
	 2eutHkjIbkbTg==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30616d71bb0so24173881fa.3
        for <linux-kbuild@vger.kernel.org>; Tue, 14 Jan 2025 04:36:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUXpAlW7uAcrby+kq0XkkFQv29vPVZfGjXuAnyb5pjUg2S4zxcB+L6tJJXqoUB2vGkTATGw+6WLalZW5Po=@vger.kernel.org
X-Gm-Message-State: AOJu0YyI/wYkHTguyAiOIOxUreeRtbHe1p1aDtQeAVHigIkkcWIE9yGb
	UR+3D/Z7nEpA4mt7qyGP/aZyZ/8oyJ32LtgSqWLUzAZF0q0113jHIL0QQUKDMNyQLf6E6BAXZYI
	esoAQdshLQxySwcd0LoQRfsnu1qA=
X-Google-Smtp-Source: AGHT+IHWQVg8hwzpNfS1dj1fvjBqtY6zGcVfY7q3EJg93fOp1bV4HtOo4/xbXNnSrqxf2eNoqh++stoNw6lTh87Mztg=
X-Received: by 2002:a2e:a987:0:b0:300:33b1:f0e1 with SMTP id
 38308e7fff4ca-305f445efbdmr78259711fa.0.1736858198190; Tue, 14 Jan 2025
 04:36:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAK7LNATLv2KSWo0BnFGXi73GVdnvc1EX23TvTkKT1U-krgBnNQ@mail.gmail.com>
 <20250113193756.721489-1-mpdesouza@suse.com>
In-Reply-To: <20250113193756.721489-1-mpdesouza@suse.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 14 Jan 2025 21:36:01 +0900
X-Gmail-Original-Message-ID: <CAK7LNASRo7C5sKVcmKv_8R449STTydUGbhtHycpp=7E7qLHdcQ@mail.gmail.com>
X-Gm-Features: AbW1kvZfHAxMESeNKvZuo9J0PZtloBMPq5n6tlOvUf_k16Uwb3V2p8Rpix2ML0g
Message-ID: <CAK7LNASRo7C5sKVcmKv_8R449STTydUGbhtHycpp=7E7qLHdcQ@mail.gmail.com>
Subject: Re: # Toplevel Makefile doesn't process module build correctly on
 recursive make calls
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Cc: Marcos Paulo de Souza <mpdesouza@suse.de>, linux-kbuild@vger.kernel.org, mbenes@suse.cz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2025 at 4:38=E2=80=AFAM Marcos Paulo de Souza
<mpdesouza@suse.com> wrote:
>
> On Sat, 14 Oct 2023 17:35:55 +0900 Masahiro Yamada <masahiroy@kernel.org>=
 wrote:
>
> > On Tue, Oct 10, 2023 at 5:43=E2=80=AFAM Marcos Paulo de Souza <mpdesouz=
a@suse.de> wrote:
> > >
> > > Hi all,
> > >
> > > I found an issue while moving the livepatch kselftest modules to be b=
uilt on the
> > > fly, instead of building them on kernel building.
> > >
> > > If, for some reason, there is a recursive make invocation that starts=
 from the
> > > top level Makefile and in the leaf Makefile it tries to build a modul=
e (using M=3D
> > > in the make invocation), it doesn't produce the module. This happens =
because the
> > > toplevel Makefile checks for M=3D only once. This is controlled by th=
e
> > > sub_make_done variable, which is exported after checking the command =
line
> > > options are passed to the top level Makefile. Once this variable is s=
et it's
> > > the M=3D setting is never checked again on the recursive call.
> > >
> > > This can be observed when cleaning the bpf kselftest dir. When callin=
g
> > >
> > >         $ make TARGETS=3D"bpf" SKIP_TARGETS=3D"" kselftest-clean
> > >
> > > What happens:
> > >
> > >         1. It checks for some command line settings (like M=3D) was p=
assed (it wasn't),
> > >         set some definitions and exports sub_make_done.
> > >
> > >         2. Jump into tools/testing/selftests/bpf, and calls the clean=
 target.
> > >
> > >         3. The clean target is overwritten to remove some files and t=
hen jump to
> > >         bpf_testmod dir and call clean there
> > >
> > >         4. On bpf_testmod/Makefile, the clean target will execute
> > >                 $(Q)make -C $(KDIR) M=3D$(BPF_TESTMOD_DIR) clean
> > >
> > >         5. The KDIR is to toplevel dir. The top Makefile will check t=
hat sub_make_done was
> > >         already set, ignoring the M=3D setting.
> > >
> > >         6. As M=3D wasn't checked, KBUILD_EXTMOD isn't set, and the c=
lean target applies
> > >         to the kernel as a whole, making it clean all generated code/=
objects and
> > >         everything.
> > >
> > > One way to avoid it is to call "unexport sub_make_done" on
> > > tools/testing/selftests/bpf/bpf_testmod/Makefile before processing th=
e all
> > > target, forcing the toplevel Makefile to process the M=3D, producing =
the module
> > > file correctly.
> > >
> > > If the M=3Ddir points to /lib/modules/.../build, then it fails with "=
m2c: No such
> > > file", which I already reported here[1]. At the time this problem was=
 treated
> > > like a problem with kselftest infrastructure.
> > >
> > > Important: The process works fine if the initial make invocation is t=
argeted to a
> > > different directory (using -C), since it doesn't goes through the top=
level
> > > Makefile, and sub_make_done variable is not set.
> > >
> > > I attached a minimal reproducer, that can be used to better understan=
d the
> > > problem. The "make testmod" and "make testmod-clean" have the same ef=
fect that
> > > can be seem with the bpf kselftests. There is a unexport call comment=
ed on
> > > test-mods/Makefile, and once that is called the process works as expe=
cted.
> > >
> > > Is there a better way to fix this? Is this really a problem, or am I =
missing
> > > something?
> >
> >
> > Or, using KBUILD_EXTMOD will work too.
>
> So it worked until 13b25489b6f8bd73ed65f07928f7c27a481f1820 ("kbuild: cha=
nge working
> directory to external module directory with M=3D"). Right now, it shows t=
he same
> error as reported before:
>
> m2c    -o /home/mpdesouza/git/linux/scripts/Makefile.build -e /home/mpdes=
ouza/git/linux/scripts/Makefile.build /home/mpdesouza/git/linux/scripts/Mak=
efile.build.mod
> make[6]: m2c: No such file or directory
>
> To reproduce, it's just execute the livepatch ksefltests:
>
> $ make kselftest TARGETS=3Dlivepatch KDIR=3D<kernel source top dir>
>
> Is there something that we can do in this case to solve this issue?

The following may work although I did not test comprehensively.

I don't know why kselftests need to be started from multiple
places (top directory and tools/testing/selftests/).


diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib.m=
k
index d6edcfcb5be8..5587ace31b9e 100644
--- a/tools/testing/selftests/lib.mk
+++ b/tools/testing/selftests/lib.mk
@@ -143,7 +143,7 @@ else
 endif

 gen_mods_dir:
-       $(Q)$(MAKE) -C $(TEST_GEN_MODS_DIR)
+       $(Q)$(MAKE) sub_make_done=3D -C $(TEST_GEN_MODS_DIR)

 clean_mods_dir:
        $(Q)$(MAKE) -C $(TEST_GEN_MODS_DIR) clean











>
> I'm quite surprised that no bots found this problem yet.
>
> >
> >
> >
> >
> >
> > --
> > Best Regards
> > Masahiro Yamada
>
> /*
>  * !REMOVE THIS COMMENT BLOCK BEFORE SENDING THIS MAIL!
>  * below are signatures added by "hkml".
>  * edit signatures below, or use "hkml signature".
>  */
>
> Sent using hkml (https://github.com/sjp38/hackermail)



--=20
Best Regards
Masahiro Yamada

