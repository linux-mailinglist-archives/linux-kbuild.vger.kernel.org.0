Return-Path: <linux-kbuild+bounces-2906-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 98ADB94B900
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 Aug 2024 10:28:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 25D131F25861
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 Aug 2024 08:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B7D7189513;
	Thu,  8 Aug 2024 08:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eUujgC6Q"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214C5188CB7;
	Thu,  8 Aug 2024 08:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723105700; cv=none; b=hzquvfguSg7jggT3GaUnvSMK09P9bFIIpf1edvcxzQKCa0RO/MMHBUVBiSx1HbdNLHWiy+pK+Dev6kNTXFx+oV33mS17gS/cfs4bt9SAWOyyRJtRFJ7t6YYSK1mgzK7H5jRUDybEkWsSsuwZ47tbYdoCLpuOvPr3ItTpc2YAIlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723105700; c=relaxed/simple;
	bh=RsjazUVd65ss4ljjNjf2jyWf8ra4rWMZAqCviNjzvgg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AtASvYwM8dyF/i1LSY3QvXQJZI/igkECbyesERVjy6t/lizB8U2lJZziym3raBiY2D0LC4pUlrnehRUUeOF8rL7Cfl1NPscHS1jsGdgCofz0T4P8MUNehmfLtO1SHOynp5HKWebZvpwV2v8z4D65fvl1cWYo/uLbQbfJ5Ce3KyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eUujgC6Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82443C4AF09;
	Thu,  8 Aug 2024 08:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723105698;
	bh=RsjazUVd65ss4ljjNjf2jyWf8ra4rWMZAqCviNjzvgg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eUujgC6Q+00QV/UTNEtslxUIgfE6Wj3JhP5K7c3O7BLoU6r49mitVsUor5yX92r/r
	 pPklzHYi4WyQbqt9BnwYDG4zBa0E5yYogbtUXdSEOUYVGiOCGMMYEe9BJ9uphm5Ap6
	 tU/pacqugVMPthdT4fb4WwXaKnzMsOTNlVuehYbh6Lm8HT+RahxVV9DnQ+fOqYLCp+
	 0HC8dfbycDFCEO6tS7imG3/otIkGKF+TWhJ3o+cimcfHDW1EQhvOFzg0/HUxtajuW6
	 io3eiFuRH6Op5aEJ3UvaRyB9rTqqmZcu8Gfogzs49OQpclzL9eLd4qXwlBJgt/Gyw8
	 IXHTTPUVVni0g==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52f025ab3a7so802616e87.2;
        Thu, 08 Aug 2024 01:28:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVINzly/XfMbRUrKt4N812HJHJ0se79eUJeGQKuM9znHK6m2NXNv0LBiCSbyFgFUe2czRaH1gUTo97inLlGZ9ujScwx8zzA93y8QY4pfQfq6bVYGstLDjuc/UMetpLaKtwpsN68KirdY3mN
X-Gm-Message-State: AOJu0Yx3HfNl3R0S10Wunl5O4BO83WtCc2L4mkzUTNcskHs3y71ggX0X
	WIKmVMWuRIm2vN+Grs560WwogGT+vWGnHNx1SR1hWOuKiH5FlrERGNm9253l4UqfvU2tdNQGplw
	Yd4PTa9R0owA3JHosPjeXXX4PBKE=
X-Google-Smtp-Source: AGHT+IF7Ja1J+RUSfN8ktEXk1bVMLJvH5ThoRCviur13k8NxgkA+MCCKahJ2QumTkUT4YsQPTfK1nMN0K0UuhwQppM4=
X-Received: by 2002:a05:6512:1095:b0:52b:c1cc:51f1 with SMTP id
 2adb3069b0e04-530e5875b4cmr731057e87.23.1723105697172; Thu, 08 Aug 2024
 01:28:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202408061634.fe6be94-oliver.sang@intel.com> <CAK7LNARnytQTW5vE+u+ez1pHuSVS34cQ0+xK+MLyfLp05GjoaA@mail.gmail.com>
 <ZrR5c1p1fPffFeB2@xsang-OptiPlex-9020>
In-Reply-To: <ZrR5c1p1fPffFeB2@xsang-OptiPlex-9020>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 8 Aug 2024 17:27:40 +0900
X-Gmail-Original-Message-ID: <CAK7LNARFuUHiEVDF3O-aFc+awXM5QdCUCUu5wqbTcZQgLLWsuA@mail.gmail.com>
Message-ID: <CAK7LNARFuUHiEVDF3O-aFc+awXM5QdCUCUu5wqbTcZQgLLWsuA@mail.gmail.com>
Subject: Re: [linus:master] [kconfig] f79dc03fe6: segfault_at_ip_sp_error
To: Oliver Sang <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 8, 2024 at 4:53=E2=80=AFPM Oliver Sang <oliver.sang@intel.com> =
wrote:
>
> hi, Masahiro Yamada,
>
> On Tue, Aug 06, 2024 at 05:57:47PM +0900, Masahiro Yamada wrote:
> > On Tue, Aug 6, 2024 at 5:21=E2=80=AFPM kernel test robot <oliver.sang@i=
ntel.com> wrote:
> > >
> > >
> > > hi, Masahiro Yamada,
> > >
> > > the config for this test is a random config, by this commit, the conf=
ig has
> > > below diff with parent:
> > >
> > > --- /pkg/linux/i386-randconfig-r032-20230623/gcc-12/ee29e6204c32dce01=
3ac6d1078d98dce5607ce86/.config    2024-08-05 12:56:30.744686432 +0800
> > > +++ /pkg/linux/i386-randconfig-r032-20230623/gcc-12/f79dc03fe68c79d38=
8908182e68d702f7f1786bc/.config    2024-08-05 12:56:37.620536644 +0800
> > > @@ -770,14 +770,14 @@ CONFIG_MODULE_UNLOAD=3Dy
> > >  CONFIG_MODULE_SIG=3Dy
> > >  # CONFIG_MODULE_SIG_FORCE is not set
> > >  CONFIG_MODULE_SIG_ALL=3Dy
> > > -CONFIG_MODULE_SIG_SHA1=3Dy
> > > +# CONFIG_MODULE_SIG_SHA1 is not set
> > >  # CONFIG_MODULE_SIG_SHA256 is not set
> > >  # CONFIG_MODULE_SIG_SHA384 is not set
> > >  # CONFIG_MODULE_SIG_SHA512 is not set
> > > -# CONFIG_MODULE_SIG_SHA3_256 is not set
> > > +CONFIG_MODULE_SIG_SHA3_256=3Dy
> > >  # CONFIG_MODULE_SIG_SHA3_384 is not set
> > >  # CONFIG_MODULE_SIG_SHA3_512 is not set
> > > -CONFIG_MODULE_SIG_HASH=3D"sha1"
> > > +CONFIG_MODULE_SIG_HASH=3D"sha3-256"
> > >  CONFIG_MODULE_COMPRESS_NONE=3Dy
> > >  # CONFIG_MODULE_COMPRESS_GZIP is not set
> > >  # CONFIG_MODULE_COMPRESS_XZ is not set
> > > @@ -6201,7 +6201,6 @@ CONFIG_FIPS_SIGNATURE_SELFTEST_ECDSA=3Dy
> > >  #
> > >  CONFIG_MODULE_SIG_KEY=3D"certs/signing_key.pem"
> > >  CONFIG_MODULE_SIG_KEY_TYPE_RSA=3Dy
> > > -# CONFIG_MODULE_SIG_KEY_TYPE_ECDSA is not set
> > >  CONFIG_SYSTEM_TRUSTED_KEYRING=3Dy
> > >  CONFIG_SYSTEM_TRUSTED_KEYS=3D""
> > >  CONFIG_SYSTEM_EXTRA_CERTIFICATE=3Dy
> > >
> > >
> > > we are not sure if these are expected?
> >
> >
> > This is expected.
> >
> > f79dc03fe68c79d388908182e68d702f7f1786bc changed the way how choice is
> > calculated.
> > So, the randconfig from the same seed can result in a different .config=
 file.
> >
> >
> >
> > > we are not sure either if the issue in below report is caused by this=
 config
> > > diff. just report what we observed in our tests FYI.
> >
> >
> > I believe it is a different issue.
> >
> > It is just a problem with the combination of depmod
> > and CONFIG_MODULE_SIG_SHA3_256=3Dy, isn't it?
>
> we are not sure. we just use randconfig to run rcutorture tests.



See this line in the error report:


[   15.209351][  T483] depmod[483]: segfault at 0 ip b7abe4f6 sp
bfb00aa4 error 4 in libc-2.31.so[8c4f6,b7a4b000+155000] likely on CPU
0 (core 0, socket 0)







> >
> >
> > What is your depmod (kmod) version?
>
> our kmod version is 28


See this again:

https://lore.kernel.org/linux-kbuild/E1rNVlL-000qDm-Pg@rmk-PC.armlinux.org.=
uk/


It clearly explains when the issue happens:

 When using the SHA3 module signing options, kmod 28 segfaults during
 "make modules_install" on the build host.



If you are using kmod 28, upgrading it will presumably fix the issue.




>
> >
> > The crash of kmod<=3D28 with CONFIG_MODULE_SIG_SHA3_384=3Dy is a known =
issue:
> >
> > https://lore.kernel.org/linux-kbuild/E1rNVlL-000qDm-Pg@rmk-PC.armlinux.=
org.uk/
> >
> >
> >
> > >
> > >
> > > Hello,
> > >
> > > kernel test robot noticed "segfault_at_ip_sp_error" on:
> > >
> > > commit: f79dc03fe68c79d388908182e68d702f7f1786bc ("kconfig: refactor =
choice value calculation")
> > > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git maste=
r
> > >
> > > [test failed on linus/master      de9c2c66ad8e787abec7c9d7eff4f8c3cdd=
28aed]
> > > [test failed on linux-next/master d6dbc9f56c3a70e915625b6f1887882c23d=
c5c91]
> > >
> > > in testcase: rcutorture
> > > version:
> > > with following parameters:
> > >
> > >         runtime: 300s
> > >         test: default
> > >         torture_type: srcud
> > >
> > >
> > >
> > > compiler: gcc-12
> > > test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m=
 4G
> > >
> > > (please refer to attached dmesg/kmsg for entire log/backtrace)
> > >
> > >
> > > +-------------------------+------------+------------+
> > > |                         | ee29e6204c | f79dc03fe6 |
> > > +-------------------------+------------+------------+
> > > | segfault_at_ip_sp_error | 0          | 30         |
> > > +-------------------------+------------+------------+
> > >
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <oliver.sang@intel.com>
> > > | Closes: https://lore.kernel.org/oe-lkp/202408061634.fe6be94-oliver.=
sang@intel.com
> > >
> > >
> > > [  OK  ] Started OpenBSD Secure Shell server.
> > > LKP: ttyS0: 263: Kernel tests: Boot OK!
> > > LKP: ttyS0: 263: HOSTNAME vm-snb-i386, MAC 52:54:00:12:34:56, kernel =
6.10.0-rc7-00022-gf79dc03fe68c 1
> > > [   12.271477][   T23] input: ImExPS/2 Generic Explorer Mouse as /dev=
ices/platform/i8042/serio1/input/input3
> > > LKP: ttyS0: 263:  /lkp/lkp/src/bin/run-lkp /lkp/jobs/scheduled/vm-met=
a-59/rcutorture-300s-default-srcud-debian-11.1-i386-20220923.cgz-i386-randc=
onfig-r032-20230623-f79dc03fe68c-20240805-47158-x4nrel-3.yaml
> > > [   15.209351][  T483] depmod[483]: segfault at 0 ip b7abe4f6 sp bfb0=
0aa4 error 4 in libc-2.31.so[8c4f6,b7a4b000+155000] likely on CPU 0 (core 0=
, socket 0)
> > > [ 15.210249][ T483] Code: 5b 5e 29 f8 5f c3 66 90 66 90 66 90 66 90 6=
6 90 66 90 66 90 56 57 8b 7c 24 0c 31 c0 89 f9 83 e1 3f 66 0f ef c0 83 f9 3=
0 77 17 <f3> 0f 6f 0f 66 0f 74 c1 66 0f d7 d0 85 d2 75 73 89 f8 83 e0 f0 eb
> > > All code
> > > =3D=3D=3D=3D=3D=3D=3D=3D
> > >    0:   5b                      pop    %rbx
> > >    1:   5e                      pop    %rsi
> > >    2:   29 f8                   sub    %edi,%eax
> > >    4:   5f                      pop    %rdi
> > >    5:   c3                      retq
> > >    6:   66 90                   xchg   %ax,%ax
> > >    8:   66 90                   xchg   %ax,%ax
> > >    a:   66 90                   xchg   %ax,%ax
> > >    c:   66 90                   xchg   %ax,%ax
> > >    e:   66 90                   xchg   %ax,%ax
> > >   10:   66 90                   xchg   %ax,%ax
> > >   12:   66 90                   xchg   %ax,%ax
> > >   14:   56                      push   %rsi
> > >   15:   57                      push   %rdi
> > >   16:   8b 7c 24 0c             mov    0xc(%rsp),%edi
> > >   1a:   31 c0                   xor    %eax,%eax
> > >   1c:   89 f9                   mov    %edi,%ecx
> > >   1e:   83 e1 3f                and    $0x3f,%ecx
> > >   21:   66 0f ef c0             pxor   %xmm0,%xmm0
> > >   25:   83 f9 30                cmp    $0x30,%ecx
> > >   28:   77 17                   ja     0x41
> > >   2a:*  f3 0f 6f 0f             movdqu (%rdi),%xmm1             <-- t=
rapping instruction
> > >   2e:   66 0f 74 c1             pcmpeqb %xmm1,%xmm0
> > >   32:   66 0f d7 d0             pmovmskb %xmm0,%edx
> > >   36:   85 d2                   test   %edx,%edx
> > >   38:   75 73                   jne    0xad
> > >   3a:   89 f8                   mov    %edi,%eax
> > >   3c:   83 e0 f0                and    $0xfffffff0,%eax
> > >   3f:   eb                      .byte 0xeb
> > >
> > > Code starting with the faulting instruction
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >    0:   f3 0f 6f 0f             movdqu (%rdi),%xmm1
> > >    4:   66 0f 74 c1             pcmpeqb %xmm1,%xmm0
> > >    8:   66 0f d7 d0             pmovmskb %xmm0,%edx
> > >    c:   85 d2                   test   %edx,%edx
> > >    e:   75 73                   jne    0x83
> > >   10:   89 f8                   mov    %edi,%eax
> > >   12:   83 e0 f0                and    $0xfffffff0,%eax
> > >   15:   eb                      .byte 0xeb
> > > [   15.251290][  T487] torture module --- srcud:  disable_onoff_at_bo=
ot=3D0 ftrace_dump_at_shutdown=3D0 verbose_sleep_frequency=3D0 verbose_slee=
p_duration=3D1 random_shuffle=3D0
> > > [   15.255881][  T487] srcud-torture:--- Start of test: nreaders=3D1 =
nfakewriters=3D4 stat_interval=3D60 verbose=3D1 test_no_idle_hz=3D1 shuffle=
_interval=3D3 stutter=3D5 irqreader=3D1 fqs_duration=3D0 fqs_holdoff=3D0 fq=
s_stutter=3D3 test_boost=3D1/0 test_boost_interval=3D7 test_boost_duration=
=3D4 shutdown_secs=3D0 stall_cpu=3D0 stall_cpu_holdoff=3D10 stall_cpu_irqso=
ff=3D0 stall_cpu_block=3D0 n_barrier_cbs=3D0 onoff_interval=3D0 onoff_holdo=
ff=3D0 read_exit_delay=3D13 read_exit_burst=3D16 nocbs_nthreads=3D0 nocbs_t=
oggle=3D1000 test_nmis=3D0
> > > [   15.258765][  T487] srcud:  Start-test grace-period state: g0 f0x0
> > > [   15.259257][  T487] rcu_torture_write_types: Testing expedited GPs=
.
> > > [   15.259713][  T487] rcu_torture_write_types: Testing asynchronous =
GPs.
> > >
> > >
> > > The kernel config and materials to reproduce are available at:
> > > https://download.01.org/0day-ci/archive/20240806/202408061634.fe6be94=
-oliver.sang@intel.com
> > >
> > >
> > >
> > > --
> > > 0-DAY CI Kernel Test Service
> > > https://github.com/intel/lkp-tests/wiki
> > >
> >
> >
> > --
> > Best Regards
> > Masahiro Yamada



--=20
Best Regards
Masahiro Yamada

