Return-Path: <linux-kbuild+bounces-1833-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1BD8C3693
	for <lists+linux-kbuild@lfdr.de>; Sun, 12 May 2024 15:05:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B6FD6B20DAA
	for <lists+linux-kbuild@lfdr.de>; Sun, 12 May 2024 13:05:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D28021A04;
	Sun, 12 May 2024 13:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n5xQhY38"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7785210FB;
	Sun, 12 May 2024 13:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715519098; cv=none; b=RJWGAQBnqO7amA/Lh5A6yjpamnApjHQzff4dmbjE3s95iZr1nXZlmeOCGlxVouRpSQFCLUparwvg86MJRK3qemMyqhzx3IrzUiDNMb/7cMjd7sA63lsZYBePJmJ75C6iQ0NGjIe7YNvLK2Ai2CjcuUdo39d9T6hKeqpCLKcFmjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715519098; c=relaxed/simple;
	bh=iKxuRfjzkLsbnpQNvycMUdmiI0SkGYOUjoOFJAsqVcQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CbEHW6gN1Pn0ev1nCecW7G2AtjLFWSFDtYkjEf2U+gQdrgOUG4hQ2qLVvc9Z2tu4L7sf9NqJj1/hrzO5eka/Ca+Ak6kedrfZ0s9wEPzTXHnL3U0ZpV139xNajcC5qxd1tuoU2BULFt9kEgp7WOrQDTlDoCwh3k1yrLZseo2WN7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n5xQhY38; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C8B4C32783;
	Sun, 12 May 2024 13:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715519097;
	bh=iKxuRfjzkLsbnpQNvycMUdmiI0SkGYOUjoOFJAsqVcQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=n5xQhY38Z5lPtgyv2CpBDoR7/ahRWgPIfZbKe/SJwvVb3SiuFLz0yjaYiZDHk0VgQ
	 0zNckxk+LJCCKRv//HwbIzZQcvnlZ0by/FYrXP5JDLgKBdZ6m6W87It0gCxXgsqhrJ
	 wWiOna4WyH9sYoWmRS1Nbeq8ELVE915my8bjokWCjN31neyGhW/j84vg78BFO7d5G2
	 NF+nMeLtrJPObOYxMXJV8T+0yS2G3CuaPiCd4ZF39oQhVLkC/PFxrDrytj9RbOljKy
	 rkScLedcfFw+o2qozOYsREMHZgsogVinXv0SZtB1MjlfEbv7E5UE8073qPohfKPruU
	 wYj9xQOwW4JYw==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-51f2ebbd8a7so3665003e87.2;
        Sun, 12 May 2024 06:04:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX+D7cSpKrjf9GNx4QYcKOE0G107dvsZUd8OjK5EHEVBCmCPIjyiAH8DsaDFnme3GrE9c4GHHlnjqrcybdX/oKHnD7ChUKm4xfKFbCw
X-Gm-Message-State: AOJu0YwRE6EUl9DH+Lp4b9t5cW1IXWR6jIt56SGeZW8C60Gan60lHdew
	R9gzXQsh6Y2G036RIko+OOQbHQ0E3rBv1FmV1TwkbEp06uQzsGjNB2XWxnVK/mUMMjdHNNix9JG
	2LCIkwCO7gz+YvleWFln+9xxY0xU=
X-Google-Smtp-Source: AGHT+IFNnhU6eqmBLwSU4lQDj8SidTmBQq3quXULwJeg3ppDjlpTI1G3mbJnX6jJ4LplhtKBJ27tICppo9mq4+yxe+4=
X-Received: by 2002:ac2:4e8d:0:b0:51f:c8f:630e with SMTP id
 2adb3069b0e04-5220fc734e1mr4239936e87.35.1715519095959; Sun, 12 May 2024
 06:04:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Zj9UDiAHqX3noTsy@archie.me>
In-Reply-To: <Zj9UDiAHqX3noTsy@archie.me>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 12 May 2024 22:04:19 +0900
X-Gmail-Original-Message-ID: <CAK7LNARrG0u2pSzAkdbzrcf_i7ByhEnDwHH=4LtaE_H7OgL=0A@mail.gmail.com>
Message-ID: <CAK7LNARrG0u2pSzAkdbzrcf_i7ByhEnDwHH=4LtaE_H7OgL=0A@mail.gmail.com>
Subject: Re: Incorrect thinlto cache directory path in Makefile
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Kernel Build System <linux-kbuild@vger.kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Kees Cook <keescook@chromium.org>, Xu Zhen <xuzhen@fastmail.com>, 
	Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+CC: Nathan


On Sat, May 11, 2024 at 8:18=E2=80=AFPM Bagas Sanjaya <bagasdotme@gmail.com=
> wrote:
>
> Hi,
>
> Xu Zhen <xuzhen@fastmail.com> reported on Bugzilla (https://bugzilla.kern=
el.org/show_bug.cgi?id=3D218825) thinlto build directory problem (especiall=
y on
> DKMS modules). He wrote:
>
> > In Makefile, the ld flag `--thinlto-cache-dir' is set to
> > `$(extmod_prefix).thinlto-cache'. But at that time, the variable extmod=
_prefix
> > had not been assigned yet. Therefore, the thinlto cache dir is always c=
reated
> > in the current directory.
> >
> > Even worse, the cache dir cannot be deleted when executing `make clean'=
. This
> > is because its path was written as `$(KBUILD_EXTMOD)/.thinlto-cache' in=
 the
> > clean: target.
> >
> > Some users have been troubled by it: https://github.com/dell/dkms/issue=
s/292
> >
> > This bug was introduced by commit dc5723b02e523b2c4a68667f7e28c65018f72=
02f


I agree this is a bug.




line 945:
  KBUILD_LDFLAGS  +=3D --thinlto-cache-dir=3D$(extmod_prefix).thinlto-cache


line 1034:
  KBUILD_LDFLAGS  +=3D $(call ld-option,--no-warn-rwx-segments)


line 1095:
  export extmod_prefix =3D $(if $(KBUILD_EXTMOD),$(KBUILD_EXTMOD)/)







$(call ld-option ) at line 1034 adds --thinlto-cache-dir=3D.thinlto-cache
because --thinlto-cache-dir=3D$(extmod_prefix).thinlto-cache was added
at line 945, but $(extmod_prefix) is empty until it is defined
at line 1095.



However, the offending line was already removed for another issue.

See the following in linux-next:


Author: Nathan Chancellor <nathan@kernel.org>
Date:   Wed May 1 15:55:25 2024 -0700

    kbuild: Remove support for Clang's ThinLTO caching




If --thinlto-cache-dir comes back,
I hope Nathan will take care of this issue.







> Thanks.
>
> --
> An old man doll... just what I always wanted! - Clara



--=20
Best Regards
Masahiro Yamada

