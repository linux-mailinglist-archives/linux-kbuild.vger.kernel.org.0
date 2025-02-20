Return-Path: <linux-kbuild+bounces-5846-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FA3A3E32B
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Feb 2025 18:57:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 226D217BE7C
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Feb 2025 17:57:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A96D4213E64;
	Thu, 20 Feb 2025 17:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ui/UB2XU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805C1211A0B;
	Thu, 20 Feb 2025 17:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740074268; cv=none; b=oUvOUBxXWYmXeZZZuPRYC+Rq89ZCdzLpkuCB4hX72FSFKPKhRj6FfmabjL8g10O3llJXpt4gDnL6I/+qN7D8p2Q7eiES0TPJmhbOxrDCDEXlMJi1yOSydvofeRJ+AAP1Nbjs+lzsuNBKVF7A6eWTKTSewEip1Ch3e8rFz7evtv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740074268; c=relaxed/simple;
	bh=ze1wYCkL/3G9KAdlrAUNDFK4CqnTfYLd5K8ye+Sq61c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s6amCfswupiMp8aSuNqL+qKzTd7FMVxtjfMnP8wsIiPUdki8RrriTkVG6iThBFvsCsQq+RKavqE1Mlgnu7dykOtVlit/CyL6/0ZEmGH+eDi/zLqnjEIT4eZjdLgU/Mu6pgP6cwi91+ShqylGReRoGp1tJlhxJ9BADDmHf1fHw7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ui/UB2XU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04864C4CEE9;
	Thu, 20 Feb 2025 17:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740074268;
	bh=ze1wYCkL/3G9KAdlrAUNDFK4CqnTfYLd5K8ye+Sq61c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Ui/UB2XUXf3eQighuvEJFv8D6TooTctORaAUcFX0Msb826eCnBT8VlsyqBqmZF90F
	 ZdxLSFZtpcGiwRXel/veXk7J++SXdQXTOx+Exp/iUWO4sERLHYv5HQ99Ntuy7USmHT
	 NR5D8GfC6QVvSb8IGlVWpbVLjeZGEInYV+FRcVGg/uHrUs4ZW6uNOuZGUUdqWg6Q2B
	 FdVu3IX0anuImC+ds/Ob0Lvi+S10OB0WbQmzNQytF3DicOQ2MZykRfqi44mFCTWbCh
	 CMhzpVmzVIRZGGA0siNXZgArDNGDkcxgOrWsotwlbttPARI+uS5Q5MQ4D+C+urPC8G
	 PqQ0NOu8QEgbQ==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54298ec925bso1934950e87.3;
        Thu, 20 Feb 2025 09:57:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUjnCGzVRofEB3VDSPOWoDEtKRMLizuMqY3LW8RXAI5+WO+03Bsj8sduBmIZdQAknpT4uzSGhbSycw8Vbs=@vger.kernel.org, AJvYcCUzyuDWr+JWGZaweMa5q1n6GKbgHaJ7Y6K/xEITcuaPcF/IiOyvBqWJtl6ULK54Va1FxqpC4g8s7Z4qNj/L@vger.kernel.org
X-Gm-Message-State: AOJu0YzX+PPl1nZtnJLle+n4siZFAqpFu3bkN3aNQHoG75TNd/M6pR0M
	cT8UievnjdKTMeVrm0Lifgdy/PG9EVhtk/+hCCka1AQVdDAauZgPfDiRXres3UuXEqGj/6T68xk
	g7u8dzZLBdwzVyeeyDh/tQYWw4kU=
X-Google-Smtp-Source: AGHT+IFpP8I4OeBKgGumvGC5DopmNDvpx6lyaLI7iXVizeqOLheijZfLN/ConG4BvrBM3pTJgGabu+7o9E1EIEUo+Tk=
X-Received: by 2002:a05:6512:33cd:b0:540:1b07:e033 with SMTP id
 2adb3069b0e04-5462ef2373cmr3572195e87.45.1740074266490; Thu, 20 Feb 2025
 09:57:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240727074526.1771247-1-masahiroy@kernel.org>
 <20240727074526.1771247-4-masahiroy@kernel.org> <b3a8816c-3846-83ab-9750-fd12041d9495@quicinc.com>
 <20250220-red-antelope-of-education-5417aa@l-nschier-nb> <0ee862ec-4c36-4c3e-ae90-627c6b0e527b@quicinc.com>
 <20250220-kickass-famous-kittiwake-c11f5b@l-nschier-nb> <80cf4e9a-5d49-4bc3-8160-1b23c31d4d36@quicinc.com>
 <2025022020-armband-clock-69af@gregkh> <13fac9ee-cad9-466b-9216-8c0516600b03@quicinc.com>
In-Reply-To: <13fac9ee-cad9-466b-9216-8c0516600b03@quicinc.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 21 Feb 2025 02:57:09 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQbVk92fjEsG4XqZM+ffZXhOe4wNchE_M=15e1_uoz6jA@mail.gmail.com>
X-Gm-Features: AWEUYZmcNYFSLEhPfGKh144lvOTzANpE7y7J-HiTw8Aj_YvMVMiRf5hbvkDyMII
Message-ID: <CAK7LNAQbVk92fjEsG4XqZM+ffZXhOe4wNchE_M=15e1_uoz6jA@mail.gmail.com>
Subject: Re: [PATCH 3/4] kbuild: slim down package for building external modules
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Nicolas Schier <n.schier@avm.de>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Ben Hutchings <ben@decadent.org.uk>, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 21, 2025 at 2:24=E2=80=AFAM Jeffrey Hugo <quic_jhugo@quicinc.co=
m> wrote:
>
> On 2/20/2025 9:49 AM, Greg KH wrote:
> > On Thu, Feb 20, 2025 at 09:31:14AM -0700, Jeffrey Hugo wrote:
> >> On 2/20/2025 8:54 AM, Nicolas Schier wrote:
> >>> On Thu, Feb 20, 2025 at 08:03:32AM -0700, Jeffrey Hugo wrote:
> >>>> On 2/20/2025 3:03 AM, Nicolas Schier wrote:
> >>>>> On Tue, Feb 18, 2025 at 01:25:38PM -0700, Jeffrey Hugo wrote:
> >>>>>> On 7/27/2024 1:42 AM, Masahiro Yamada wrote:
> >>>>>>> Exclude directories and files unnecessary for building external m=
odules:
> >>>>>>>
> >>>>>>>      - include/config/  (except include/config/auto.conf)
> >>>>>>>      - scripts/atomic/
> >>>>>>>      - scripts/dtc/
> >>>>>>>      - scripts/kconfig/
> >>>>>>>      - scripts/mod/mk_elfconfig
> >>>>>>>      - scripts/package/
> >>>>>>>      - scripts/unifdef
> >>>>>>>      - .config
> >>>>>>
> >>>>>> Please revert this (the removal of .config).
> >>>>>>
> >>>>>> I got some strange reports that our external module install broke,=
 and
> >>>>>> traced it to this change.  Our external module references the .con=
fig
> >>>>>> because we have different logic for the build depending on if othe=
r, related
> >>>>>> modules are present or not.
> >>>>>>
> >>>>>> Also, it looks like this broke DKMS for some configurations, which=
 not only
> >>>>>> impacts DKMS itself [1] but also downstream projects [2].
> >>>>>>
> >>>>>> While DKMS may be updated going forward to avoid this issue, there=
 are
> >>>>>> plenty of affected version out in the wild.
> >>>>>>
> >>>>>> Also, I haven't surveyed every distro, but it looks like Ubuntu st=
ill
> >>>>>> packages the .config with their headers in their upcoming "Plucky"=
 release
> >>>>>> based on 6.12.  I suspect they wouldn't do that if they didn't fee=
l it was
> >>>>>> needed/useful.
> >>>>>>
> >>>>>> -Jeff
> >>>>>>
> >>>>>> [1]: https://github.com/dell/dkms/issues/464
> >>>>>> [2]: https://github.com/linux-surface/linux-surface/issues/1654
> >>>>>
> >>>>> Hi Jeff,
> >>>>>
> >>>>> do you know the related thread [1]?  According to the last mail, DK=
MS
> >>>>> has fixed its issue already in December.
> >>>>
> >>>> DKMS tip might be fixed, but production versions are in various dist=
ros,
> >>>> which are not updated.  Therefore actual users are impacted by this.
> >>>>
> >>>> What happened to the #1 rule of kernel, that we do not break users?
> >>>
> >>> I think, Masahiro already provided valid and profound reasons for
> >>> keeping it the way it is.  Users of run-time kernel interfaces are no=
t
> >>> affected by the change.  Concretely reported issues were, as far as I
> >>> know, only a matter of specific non-official way to work with .config
> >>> for other reasons than just building external kernel modules in the w=
ay
> >>> it is thought to work.
> >>
> >> I'm CCing the regressions list, which I probably should have done init=
ially.
> >>
> >> I'm pretty sure Linus has indicated that as soon as users start doing
> >> something, that becomes the "official way".  I believe your response i=
s not
> >> consistent with the precedent set by Linus.
> >>
> >> Quoting from [1]:
> >> It=E2=80=99s a regression if some application or practical use case ru=
nning fine
> >> with one Linux kernel works worse or not at all with a newer version
> >> compiled using a similar configuration. The =E2=80=9Cno regressions=E2=
=80=9D rule forbids
> >> this to take place; if it happens by accident, developers that caused =
it are
> >> expected to quickly fix the issue."
> >
> > Regressions are at runtime, not with how external tools poke around in
> > kernel source trees and try to make decisions.  If we were to never be
> > able to change our source just because there might be an external user
> > that we don't know of, that would be crazy.
>
> As a kernel developer, I get this.  The MAX_ORDER thing from a few
> versions ago seemed to make this a grey area.  Perhaps it a case by case
> thing.  In which case, what is the harm in sharing the kernel's .config
> which has been a thing since I started kernel development back in the
> 2.6.X times?
>
> > We want users to not be afraid to upgrade their kernel, that has nothin=
g
> > to do with how the kernel build is interacted with external stuff.
>  > >> As far as I understand its not acceptable to force users to change
> (the DKMS
> >> fix) or update userspace to work with a new kernel.  You could make a =
change
> >> if userspace updated, and all old versions needing the previous behavi=
or
> >> were phased out of use, but we have 2 reports indicating that is not t=
he
> >> case.
> >
> > You are attempting to build kernel modules outside of the kernel tree,
> > and as such, have to adapt to things when they change.  That's always
> > been the case, you've had to change things many times over the years,
> > right?
>
> While true, its possible to build an external module against 6.11 and
> 6.12 and still hit a failure because of this change (see below about DKMS=
).
>
> >
> >>  From the thread you pointed out, it looks like Masahiro recommends
> >> ${kernel_source_dir}/include/config/auto.conf as a replacement for the
> >> .config.  Ignoring that such a suggestion seems to violate the regress=
ions
> >> rule, doing a diff of that and the .config on a 6.11 build (before the
> >> change we are discussing), there are many changes.  It does not look l=
ike
> >> that is an equivalent replacement.
> >
> > What do you need/want to parse the .config file in the first place?  Wh=
y
> > not rely on the generated .h files instead as those can be parsed the
> > same way as before, right?
>
> Two usecases -
>
> First when secure boot is enabled, DKMS looks for CONFIG_MODULE_SIG_HASH
> to figure out signing the modules so that they can be loaded.  Removing
> .config causes an error in DKMS and the module signing process will
> fail.  The resulting modules (already compiled successfully) will fail
> to load.  Whatever the user needed those modules for will no longer work.
>
> If the user is on Ubuntu, and has built a kernel 6.12 or later, they
> need to build upstream DKMS and use it as none of the Canonical provided
> DKMS builds have the fix.  This feels like a situation that would make
> the user afraid to upgrade their kernel (to your point above).
>
> This feels very much like an "at runtime" issue, assuming external
> modules are supported.  I may be wrong here.
>
> I'm not a DKMS developer, but I do use it, and find it extremely handy
> to take latest upstream code and apply it older kernels that customers
> seem to want to use.
>
> Second, our usecase is that we look at the .config to tell if a
> particular driver is included in the kernel build (config =3Dy or =3Dm).
> This driver provides diagnostic information which is useful to our
> product, but not required for operation.  It does not have headers that
> are exposed to the rest of the kernel, so checking the generated .h
> files does not work.  If the driver is not built, we provide a
> backported version that is then built out of tree.

External modules should not parse the .config.
It was documented 20 years ago.

See the bottom of this:
https://git.kernel.org/pub/scm/linux/kernel/git/history/history.git/commit/=
?id=3D65e433436b5794ae056d22ddba60fe9194bba007

"External modules have traditionally used grep to check for specific
 CONFIG_ settings directly in .config. This usage is broken.
As introduced before external modules shall use kbuild when building
and therefore can use the same methods as in-kernel modules when testing
for CONFIG_ definitions.
"

The commit date is 2004.

The .config is a saved kernel configuration.
Kbuild does not use it at compile time.
External modules should follow the Kbuild rule
(that is, use include/config/auto.conf instead)


While commit 1a59bd3ca5d8fde10d082e56c3073f7fa563e73b
deleted it, the reason is this information is stale.
If we do not ship the .config in the package,
we do not need to say "do not parse .config".


You repeatedly fail to understand the regression in this context.
We promise backward-compatibility for userspace interfaces.
(system calls, UAPI headers, etc.)

We do not promise anything to external modules:
 - Header files under include/ (except uapi/) are changed without caring
   about the breakage of external modules
 - EXPORT_SYMBOL is dropped if no user is present in upstream



>
> I can, with effort, extend the logic to first look for a .config (since
> the distros provide that), and if not, then look for the auto.conf
> (assuming that doesn't get determined to be not useful) to kick off our
> logic.  We'd still face the DKMS issue above so my preference would be a
> revert since it addresses both problems.
>
> -Jeff
>
>
>


--=20
Best Regards
Masahiro Yamada

