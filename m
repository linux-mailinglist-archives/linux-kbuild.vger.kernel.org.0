Return-Path: <linux-kbuild+bounces-4599-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDFC9C2FAB
	for <lists+linux-kbuild@lfdr.de>; Sat,  9 Nov 2024 22:54:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B817E1C20B0B
	for <lists+linux-kbuild@lfdr.de>; Sat,  9 Nov 2024 21:54:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00D121A00F8;
	Sat,  9 Nov 2024 21:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wo2iwjTC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBABF19F47A;
	Sat,  9 Nov 2024 21:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731189273; cv=none; b=JVZFCB5Pepjv1vUPi+uFWMXCcjtx1XoQ4hKNQTOOTrTSAhIU+GIQvWbDyxyye+ELKYAjTLL1d6V2G0d6qnomY08yyOkjPTkIJLfMgIWAcG6u8lGKzeu1BRtq1oOQrhzfGQ7KX1b5FGv8VQe8k+3mgOHEw2YVJYfnB3N9gijCOwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731189273; c=relaxed/simple;
	bh=BUaskLxR1GreD/h9zIqmtGWDYFgSFW3lTBDqlj0a9uM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ixApixY3z8+O85u2TgaA9X1SXnMaHHyDWzM1ADZl7q3Fq06gzlJAoYxxpJrDF48lxP6Sc2QviyLck3HNgqUq4oe4HBrJ5WRBmNW9QJ0T6MF5CJbqrBzqCtzO2BQTbih0PDqqXnTIQMcWB8+musklPxOGGlOe0mi5Ge32HGbdAnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wo2iwjTC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C66CC4CED5;
	Sat,  9 Nov 2024 21:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731189273;
	bh=BUaskLxR1GreD/h9zIqmtGWDYFgSFW3lTBDqlj0a9uM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Wo2iwjTCUOAPEukxBZuV0ZIkV0UkPeokrS7HUXpQ3hkHuZmVUmGdVRN4TfbsJtfNb
	 /NzUHwxCAZG8b9iO+Teop9apkU0arQQsDEzu8/rt5uPfKlj/Jt8Xc0GzsH+imrwK6d
	 Ao16OrE2cr7KAdiPNSxFRA4D7WsGZcnzwyQW7YKpyewcEZBXAsDfnmf+GBFjmM2TOH
	 Zku1XEEiEasv1bRbyUpzC1rvE83NxhbYVIZnQBmzDU8fauFZX61zCZK/9+sHS1vjcE
	 Iz0v4uv4kJoVEr1gCqvF+HmRUsLuWqtXGmSZrhPBiW8olSLpxTn2XWBljwyk5XxrVM
	 Cn9z7SRJTusBg==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2fb5fa911aaso41066461fa.2;
        Sat, 09 Nov 2024 13:54:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV5d/BZCOnJUpztUtvEifflI85kOzewpCYK300UemOMbk5xDUZu52U/WbCOQb5ykl8mhzKyn3Thq0hct3U=@vger.kernel.org, AJvYcCXhPYK/KgBI37a6uu+O+mn8Yzy37wnZ0A6SatLT7W8qCSy4bXWNlzxrxb2YeJjNs6VAnMT0Gy6px1SjC4RL@vger.kernel.org
X-Gm-Message-State: AOJu0YzX48U+qbBGF1q1w1CLFJDasWPiheom+CuIIZVktVv5pq4KfBDx
	4OUw/H4TjLHOR731zr+5IIfil+WghxOAXCub5GYxWy6xb1b2dTVPvH4wj0auo8C5/XLi0KQY0Zh
	ux07IkrBP2iigMI77eafqLVWkG2s=
X-Google-Smtp-Source: AGHT+IFzQfMaGAyc/vlcD/pyStYAkvwiojfiADOsdw62Brt+4/oXzpHBsyX/s+wYrEnSv/JO1IIXYT8Gj0t53KJNGZA=
X-Received: by 2002:a2e:a902:0:b0:2fc:9869:2e0b with SMTP id
 38308e7fff4ca-2ff201d3001mr57263831fa.20.1731189271898; Sat, 09 Nov 2024
 13:54:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZxkYYLbiXZ3p59iu@fjasle.eu> <20241106191846.2079521-1-matt@readmodwrite.com>
In-Reply-To: <20241106191846.2079521-1-matt@readmodwrite.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 10 Nov 2024 06:53:55 +0900
X-Gmail-Original-Message-ID: <CAK7LNARi=SVL_b-FhbGtxDmyBgRFtxWrk+F98cmabRWZBHzTUQ@mail.gmail.com>
Message-ID: <CAK7LNARi=SVL_b-FhbGtxDmyBgRFtxWrk+F98cmabRWZBHzTUQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] kbuild: deb-pkg: add pkg.linux-upstream.nokernelheaders
 build profile
To: Matt Fleming <matt@readmodwrite.com>
Cc: nicolas@fjasle.eu, benh@debian.org, justinstitt@google.com, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, re@w6rz.net, kernel-team@cloudflare.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 7, 2024 at 4:18=E2=80=AFAM Matt Fleming <matt@readmodwrite.com>=
 wrote:
>
>
> Hey there,
>
> Can you explain how this change works a bit more? This reads like it's no=
w
> impossible to build the debian linux-headers package with clang? At Cloud=
flare,
> we're using a custom build of gcc, not the gcc-x86-64-linux-gnu package, =
and
> with this change we can no longer build linux-headers.

You need to install the gcc-x86-64-linux-gnu package.
This is available on both Debian and Ubuntu.

Adding the prefix is required to reliably produce the correct
linux-headers package.

For example, when building a linux-headers package for i386 on amd64,
userspace tools must be recompiled with 'i686-linux-gnu-gcc'.


> What's the solution for those of us that want to build the linux-headers =
deb
> package but can't install gcc-*-linux-gnu?

DPKG_FLAGS=3D-d

will skip the build dependency check, but 'x86_64-linux-gnu-gcc'
is still required.

If only clang is available on your system, you need a workaround,
e.g.

 ln -s clang ~/bin/x86_64-linux-gnu-gcc

Anyway, you need to find a solution.

--=20
Best Regards
Masahiro Yamada

