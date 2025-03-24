Return-Path: <linux-kbuild+bounces-6308-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E28BA6D2ED
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Mar 2025 03:03:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B7EB3B1531
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Mar 2025 02:02:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A9C919BBA;
	Mon, 24 Mar 2025 02:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cDP9A9tK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F28417E4
	for <linux-kbuild@vger.kernel.org>; Mon, 24 Mar 2025 02:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742781786; cv=none; b=BarVa/OyyflaaTmcb7kSiE+45W7mOEpM3VzYMJmysQm6mHRDvxxEvrts2/TnbefDfXUUZBSyaaTTGf9eVUZkOyjnCK9F02u1JipNWbLG5CkYpLkB3s9rMzaK1Spaq9c0qxjK39yY94GwvrcNGJ0dlWAKgz/q0TKxmaOH5io96xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742781786; c=relaxed/simple;
	bh=a8wvSRzjU7XE8VYYqWB4tJ4esDBEnS+ZrcHSUQVL8P8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JxIqAaaB4lc2fi135E3Ikxp5bGaOX11WRZy9YLcIni0Kx7DSFjYWsPcYCT3lNKpKOCkvzzgWj5OVA1yWdP4Oy2RhbwS2v0pqeSiK2jsKLIdsi/SR/tbwvbDlg7mZU7tFDBHo7MkQS6ICIapvznVo4Bp2UsUOPMWeMJLBEumqpgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cDP9A9tK; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30bd21f887aso34358921fa.1
        for <linux-kbuild@vger.kernel.org>; Sun, 23 Mar 2025 19:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1742781781; x=1743386581; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8MALJfAG5gvtESuCkLnLe7ALtEnDUMs5WOUPpt46yLQ=;
        b=cDP9A9tKL8hTPIoTZknK5nhrEyTNLNC8dX7/sfAKHZnxf2gH38npdYLvS2BSbVZpBG
         QmO9ABPVC/TSdPeXpM8aHr6hgmpb6h/ClexkKFEYr5B4o7AbSPmYWoEWXtPmNmFWCIPt
         LorMWoRtjGi6QNaq86iv321w8ZuOhop/kEu50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742781781; x=1743386581;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8MALJfAG5gvtESuCkLnLe7ALtEnDUMs5WOUPpt46yLQ=;
        b=Fm7pDPvPjtsyY8kiyw9Un2Way/IokgxNunvBRWtxXKsI4dfOHQ52k6zYkfFbGJzgkO
         aIrlHjd1ejheB2sAiGPAZSgvZDb5Dnk0T+mDmg0pvwJiuaIkJlhBhaG2LXJ6WiM1iQP3
         YMA4dpzHwGd8LQXRgWMuju2giCejAXdARpBE3Tr+aNPubHO0KFd2B8onYYjadrtZAwrI
         wcu6Bq9ubwygvxJ1bEvs4ENrOeCfZ/4FpXaJn/CtzYLoNi0UKWW/cvtJz4vIyr32mteV
         w5QXO99ToRLcM50N3D0x1ZhX+VqN+qRr5K+ednvZLkuuJRzOWCbnO8k9IDsUr7icJZr/
         B87g==
X-Forwarded-Encrypted: i=1; AJvYcCXVDLLaZxmqxIEXsoiU/lB20Q645nZMuod1eITr+79nfil3lW7nnibtSEHudGB/JKxo2kn0nTUoquebi9M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtDHiwSvcXc75SJeqhlLKUOa/UUCvrNvvYYU7GUb9znSogjL4l
	dmoEsXyCPgQNPAdCLFXK0IRY7w+KUS1NlnFO65m++MSpSuQ9NFwrUelnIHyTUfZuDYTUuHfZS4c
	=
X-Gm-Gg: ASbGncu4V6MxT7ixP6olWaq2imS1ugnLnZME0YSe3539YQ4rqJoVSCEjNw95tQJF4Uh
	XU7W98EGzcRrHTDJtOwFS2xafO/elhmRu/qFcBzIRyzKXj/0iylND3x+2cD8Zxh6+JzgEl8KBrc
	lP5lpesCEz1otYn8D/hQlRF8lksstoyByN1/Fzb5uOVdp/vTOIUVWL5UTU3gGxQLlrFdL1qz6o2
	8F8+93i8AMd4WPggMpjk4roM+LBE6AKlEx5nZM+4gnLWD+i+pjgWaVj+doX5KmHkeuuZbY0xlm3
	gUkjx2kqBnld14JOXHeP8scVtTjzle+3p6vltcTGHauNuwrRewoVLYhcZtdggUKuCtWIVWGbkWT
	D7zO1xIgO
X-Google-Smtp-Source: AGHT+IERvx81hVVi+qC76l5snBXxNqNQ2iCTU+VbxMUIqTuWm9mevmttgyR82JHVyHdYzJH+F4CwIA==
X-Received: by 2002:a2e:bc1b:0:b0:30c:f60:6c6 with SMTP id 38308e7fff4ca-30d7e202fc2mr38570181fa.6.1742781780882;
        Sun, 23 Mar 2025 19:03:00 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30d7d8f3eb1sm12138221fa.87.2025.03.23.19.02.58
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Mar 2025 19:02:58 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-549b12ad16eso4120917e87.0
        for <linux-kbuild@vger.kernel.org>; Sun, 23 Mar 2025 19:02:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX3rjK+o2h+4dagMQ2oIDsclajH2PybdAjaqBpHbrG1BEDAKqN5/LXuEOEYDkpBqNDRWXGP88hTRuhrQrk=@vger.kernel.org
X-Received: by 2002:a05:6512:3b11:b0:549:8ebe:b3b1 with SMTP id
 2adb3069b0e04-54ad6480a93mr3448008e87.10.1742781777734; Sun, 23 Mar 2025
 19:02:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250211002930.1865689-1-masahiroy@kernel.org>
 <CAD=FV=V19pgzU8NSyWwHSEs85kU_Fbofcn8uJVj-TE2DNKfUHQ@mail.gmail.com> <CAK7LNAQX03w=AVkntA=8KmSAmX91Z3BdB4Z8H5oDt3iPsJNXfg@mail.gmail.com>
In-Reply-To: <CAK7LNAQX03w=AVkntA=8KmSAmX91Z3BdB4Z8H5oDt3iPsJNXfg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sun, 23 Mar 2025 19:02:44 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V355McabzO0sEwy_bbYZjPTGF=8iLU9wqQWDiFg9h-DQ@mail.gmail.com>
X-Gm-Features: AQ5f1JrVGIi5RXrUZvDS5fqcRDUYmFYIOnPrTLF5iUAPdzU68erT4ONc4AJ6NJ8
Message-ID: <CAD=FV=V355McabzO0sEwy_bbYZjPTGF=8iLU9wqQWDiFg9h-DQ@mail.gmail.com>
Subject: Re: [PATCH] tools: fix annoying "mkdir -p ..." logs when building
 tools in parallel
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
	linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>, 
	Borislav Petkov <bp@suse.de>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	bpf@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Mar 22, 2025 at 7:50=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Wed, Mar 19, 2025 at 1:41=E2=80=AFAM Doug Anderson <dianders@chromium.=
org> wrote:
> >
> > Hi,
> >
> > On Mon, Feb 10, 2025 at 4:30=E2=80=AFPM Masahiro Yamada <masahiroy@kern=
el.org> wrote:
> > >
> > > When CONFIG_OBJTOOL=3Dy or CONFIG_DEBUG_INFO_BTF=3Dy, parallel builds
> > > show awkward "mkdir -p ..." logs.
> > >
> > >   $ make -j16
> > >     [ snip ]
> > >   mkdir -p /home/masahiro/ref/linux/tools/objtool && make O=3D/home/m=
asahiro/ref/linux subdir=3Dtools/objtool --no-print-directory -C objtool
> > >   mkdir -p /home/masahiro/ref/linux/tools/bpf/resolve_btfids && make =
O=3D/home/masahiro/ref/linux subdir=3Dtools/bpf/resolve_btfids --no-print-d=
irectory -C bpf/resolve_btfids
> > >
> > > Defining MAKEFLAGS=3D<value> on the command line wipes out command li=
ne
> > > switches from the resultant MAKEFLAGS definition, even though the com=
mand
> > > line switches are active. [1]
> > >
> > > The first word of $(MAKEFLAGS) is a possibly empty group of character=
s
> > > representing single-letter options that take no argument. However, th=
is
> > > breaks if MAKEFLAGS=3D<value> is given on the command line.
> > >
> > > The tools/ and tools/% targets set MAKEFLAGS=3D<value> on the command
> > > line, which breaks the following code in tools/scripts/Makefile.inclu=
de:
> > >
> > >     short-opts :=3D $(firstword -$(MAKEFLAGS))
> > >
> > > If MAKEFLAGS really needs modification, it should be done through the
> > > environment variable, as follows:
> > >
> > >     MAKEFLAGS=3D<value> $(MAKE) ...
> > >
> > > That said, I question whether modifying MAKEFLAGS is necessary here.
> > > The only flag we might want to exclude is --no-print-directory, as th=
e
> > > tools build system changes the working directory. However, people mig=
ht
> > > find the "Entering/Leaving directory" logs annoying.
> > >
> > > I simply removed the offending MAKEFLAGS=3D.
> > >
> > > [1]: https://savannah.gnu.org/bugs/?62469
> > >
> > > Fixes: a50e43332756 ("perf tools: Honor parallel jobs")
> > > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > > ---
> > >
> > >  Makefile | 9 ++-------
> > >  1 file changed, 2 insertions(+), 7 deletions(-)
> >
> > I happened to sync up to mainline today and noticed that my build was
> > broken. I bisected it to this change and reverting this change fixes
> > my build on mainline.
> >
> > In my case I'm building in a ChromeOS environment and using clang as
> > my compiler. I'm also cross-compiling an arm64 kernel on x86 host.
> > ...but the pure mainline kernel should work there. Presumably the
> > environment is a bit different compared to the typical one, though?
> >
> > The error comes up when doing a clean build and the first error message=
s are:
> >
> > In file included from libbpf.c:36:
> > .../tools/include/uapi/linux/bpf_perf_event.h:14:21: error: field has
> > incomplete type
> >       'bpf_user_pt_regs_t' (aka 'struct user_pt_regs')
> >    14 |         bpf_user_pt_regs_t regs;
> >       |                            ^
> > .../tools/include/../../arch/arm64/include/uapi/asm/bpf_perf_event.h:7:=
16:
> > note: forward
> >       declaration of 'struct user_pt_regs'
> >     7 | typedef struct user_pt_regs bpf_user_pt_regs_t;
> >       |                ^
> >
> > btf_dump.c:1860:10: error: cast to smaller integer type 'uintptr_t'
> > (aka 'unsigned int') from 'const void *'
> >       [-Werror,-Wvoid-pointer-to-int-cast]
> >  1860 |         return ((uintptr_t)data) % alignment =3D=3D 0;
> >       |                 ^~~~~~~~~~~~~~~
> > btf_dump.c:2045:4: error: format specifies type 'ssize_t' (aka 'long')
> > but the argument has type 'ssize_t' (aka 'int')
> >       [-Werror,-Wformat]
> >  2044 |                 pr_warn("unexpected elem size %zd for array
> > type [%u]\n",
> >       |                                               ~~~
> >       |                                               %d
> >  2045 |                         (ssize_t)elem_size, id);
> >       |                         ^~~~~~~~~~~~~~~~~~
> > ./libbpf_internal.h:171:52: note: expanded from macro 'pr_warn'
> >   171 | #define pr_warn(fmt, ...)       __pr(LIBBPF_WARN, fmt, ##__VA_A=
RGS__)
> >       |                                                   ~~~    ^~~~~~=
~~~~~
> >
> >
> > I don't have time to dig right now, but I figured I'd at least post in
> > case the problem is obvious to someone else.
>
> I do not understand how to reproduce this.
>
> Your build machine is Chrome OS, or other distributions?
> Did you build the upstream kernel or downstream one?
> What is the build command?  Just "make" ?

Unfortunately, it's not a simple set of steps to reproduce and would
take a lot of time / disk space. :( Essentially, the steps are:

1. Setup a ChromeOS development environment. This is a pretty massive
thing. You'd have to follow the Developer Guide [1].

2. Enter the "chroot" in the development environment and build for a
board like "trogdor". This is an arm64 Chromebook.

3. The "trogdor" board normally builds a v6.6-based kernel, so it
looks for the kernel sources in `src/third_party/kernel/v6.6`. ...but
you can go into that folder and simply checkout a pure upstream kernel
as talked about in [2].

3. Inside the ChromeOS "chroot", you can do `cros-workon-trogdor start
chromeos-kernel-6_6` and `emerge-trogdor chromeos-kernel-6_6`. Since
you've checked out the upstream kernel to the v6.6 directory this
won't actually be building 6.6 but will be building the upstream
kernel.

...and that's where I see the error, which is "fixed" by reverting this pat=
ch.

FWIW: the actual build instructions for building the kernel are mostly
in cros-kernel.eclass [3].


Given how time consuming that would be to reproduce, I'm not sure it's
worth your time. Let me do some simple debugging... So I added these
extra printouts:

 tools/: FORCE
+       echo DOUGa new: "$(MAKEFLAGS)"
+       echo DOUGa old: "$(tools_silent) $(filter --j% -j,$(MAKEFLAGS))"

 tools/%: FORCE
+       echo DOUGb new "$(MAKEFLAGS)"
+       echo DOUBb old: "$(tools_silent) $(filter --j% -j,$(MAKEFLAGS))"

...and when I build, I see:

DOUGb new krR -j128 --jobserver-auth=3D3,4 --no-print-directory --
CLANG_CROSS_FLAGS=3D--target=3Daarch64-cros-linux-gnu
HOSTLD=3Dx86_64-pc-linux-gnu-ld.lld
HOSTPKG_CONFIG=3Dx86_64-pc-linux-gnu-pkg-config
HOSTCXX=3Dx86_64-pc-linux-gnu-clang++ HOSTCC=3Dx86_64-pc-linux-gnu-clang
CXX=3Daarch64-cros-linux-gnu-clang++\
CC_COMPAT=3Darmv7a-cros-linux-gnueabihf-clang
CC=3Daarch64-cros-linux-gnu-clang\  AR=3Dllvm-ar NM=3Dllvm-nm
STRIP=3Dllvm-strip REAL_STRIP=3Dllvm-strip OBJCOPY=3Dllvm-objcopy
LD_COMPAT=3Dld.lld LD=3Dld.lld
O=3D/build/trogdor/var/cache/portage/sys-kernel/chromeos-kernel-6_6 V=3D0

DOUBb old:  --jobserver-auth=3D3,4

...so pretty different! :-) I guess it used to be filtering out all
the cross-compiler info and now it isn't?


[1] https://www.chromium.org/chromium-os/developer-library/guides/developme=
nt/developer-guide/
[2] https://chromium.googlesource.com/chromiumos/overlays/chromiumos-overla=
y/+/HEAD/eclass/cros-kernel/README.md
[3] https://chromium.googlesource.com/chromiumos/overlays/chromiumos-overla=
y/+/HEAD/eclass/cros-kernel.eclass

