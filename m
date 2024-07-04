Return-Path: <linux-kbuild+bounces-2374-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD15E927A84
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jul 2024 17:53:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 70EDFB20F2C
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jul 2024 15:53:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D840A1A2C1E;
	Thu,  4 Jul 2024 15:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gdRimx31"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB02D1957E2;
	Thu,  4 Jul 2024 15:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720108399; cv=none; b=k/ZAIMCsiYTNu6hijXRTDUtDIIfMN5As1o/CqvLZjuoBNFPTTHZ+wJcd1QhLbAJVr2bcfx8lINEfHY4UaW0jER5eV73oiDcy6b7xLjYikxYsYE2L0NBXblilhgWAIGxDxMeZdOMNKUF1T/2591Lu34hsik7e0410rjAD0wgEo/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720108399; c=relaxed/simple;
	bh=61l6teuJlEzZyOFcsWs+mbD0J9foS4nJQ+B9XDWMorQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N5CoUrf12i8Vs4+0y8PiL2g1kMkhVNgMdpXbQUJiYTZOaRCj0obr2d5cqMG0IYsfg2iEJfMKSa+szZEZG7hBk86j/FB2MrQV8HNb5N0DI/ZwLisg0h2907DiNEwdvR5bon/MEPgfCnWubc6DYj8FUx59CUtyH3ffXew828KyUBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gdRimx31; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40970C4AF0B;
	Thu,  4 Jul 2024 15:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720108399;
	bh=61l6teuJlEzZyOFcsWs+mbD0J9foS4nJQ+B9XDWMorQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gdRimx3175BZ3d+E62tb/17JlZd5eqDNABguLplJJ3VHOS3kNBmAQawRvOdAoSS6y
	 x87YKgtermBnwASS3thCOuxZ+z0aDKPRoCrzUk5SKRVIO6CuWC4p1MNiziHQIMSFIV
	 9LzwoWdXtSNHapeSGY0wGyzdFozm3zgHh0ZnDjxvvxqAjNnd5yKkl5urcXIxZZwdJF
	 R5uIEZjsG7l3xBfl4nNOt5BzZUUNY3J5Soy6W7pyJEe600PF6PYFSebY2JnClUiSpS
	 7ZczG86C0tNLqBlwJOmDFz44GS82g14JgGaoz/sAfna797FBxcPSTtuJ8QwWiSGtH6
	 cucas6OwtTikA==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2eabd22d3f4so8323961fa.1;
        Thu, 04 Jul 2024 08:53:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWM9GfM1F8bpohN93aBdgkvIO75o4HVrIUNXsJD9+pLhHY+EhS+DnqQmVUq63i241WwueFrFM4TiJW+mb1ZOCWTS9Cs0T38PbdYfvoT
X-Gm-Message-State: AOJu0YwPUnXgfpS/b7gcM0t1QGVV8HXZ7p+kUzhBFvaloehXxMjDuktk
	RIk/ChVOsDmj/Af6qUX8stYNmZJi8i/VZbskLrwNlPAKBl7XdVTouX1VPGu0b+AWyPBr4LQscQZ
	uqBChDy2WrpO5fUdGHg4JFR9FYFE=
X-Google-Smtp-Source: AGHT+IF+Aw1bgS7PdZsgoo1/EVMcqZxz2NTYdi53SZKrEOA58gppKFHLxoNv+6Y0O5QXKPjZqZzNHnk9VyEFaDXFxEc=
X-Received: by 2002:a2e:91d6:0:b0:2ec:529e:6522 with SMTP id
 38308e7fff4ca-2ee8ed62d25mr13737001fa.31.1720108397778; Thu, 04 Jul 2024
 08:53:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAK7LNATxSePzOrHaQvS1MQo4mpAwdfwrDu3iuUsYZ+RL=LiirA@mail.gmail.com>
 <20240611211123.959459-3-aquini@redhat.com>
In-Reply-To: <20240611211123.959459-3-aquini@redhat.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 5 Jul 2024 00:52:41 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQba5CDetpwevSoaOLJ21s1tO9ZHh=7gJpPCNK0AnHfJw@mail.gmail.com>
Message-ID: <CAK7LNAQba5CDetpwevSoaOLJ21s1tO9ZHh=7gJpPCNK0AnHfJw@mail.gmail.com>
Subject: Re: [PATCH 2/2] kbuild: rpm-pkg: introduce a simple changelog section
 for kernel.spec
To: Rafael Aquini <aquini@redhat.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 12, 2024 at 6:11=E2=80=AFAM Rafael Aquini <aquini@redhat.com> w=
rote:
>
> Fix the following rpmbuild warning:
>
>   $ make srcrpm-pkg
>   ...
>   RPM build warnings:
>       source_date_epoch_from_changelog set but %changelog is missing
>
> Signed-off-by: Rafael Aquini <aquini@redhat.com>
> ---
>  scripts/package/kernel.spec | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spec
> index 19e458341f45..126b23c1f6c2 100644
> --- a/scripts/package/kernel.spec
> +++ b/scripts/package/kernel.spec
> @@ -132,3 +132,8 @@ fi
>  /usr/src/kernels/%{KERNELRELEASE}
>  /lib/modules/%{KERNELRELEASE}/build
>  %endif
> +
> +%changelog
> +* %(echo "$(LC_ALL=3DC; date +'%a %b %d %Y') $(git config --get user.nam=
e) \
> +<$(git config --get user.email)>") - %{version}-%{release}
> +- Custom built Linux kernel.
> --
> 2.45.1
>


This approach is wrong because %(...) is not expanded when generating
the source package.


Expand the generated SRPM to see what has happened.


[vagrant@fedora39 ~]$ rpm2cpio
kernel-6.10.0_rc3_00002_gdb908e378f93-6.src.rpm | cpio -idvm

[vagrant@fedora39 ~]$ tail -n 4 kernel.spec
%changelog
* %(echo "$(LC_ALL=3DC; date +'%a %b %d %Y') $(git config --get user.name) =
\
<$(git config --get user.email)>") - %{version}-%{release}
- Custom built Linux kern



This %changelog section is meaningless, as it does not contain
any useful information about the person who packaged it.



Just like mkdebian, this log information must be generated
when you create the package.


Using 'git config' is OK, but git is optional for 'make binrpm-pkg'.

So, you need to add fallback defaults in case git is not available.
(this code is available in scripts/package/mkdebian)





How about adding this to scripts/package/mkspec?


if [ "$(command -v git)" ]; then
        name=3D$(git config user.name) || true
        email=3D$(git config user.email) || true
fi

if [ ! "${name:+set}" ]; then
        name=3D${KBUILD_BUILD_USER:-$(id -nu)}
fi

if [ ! "${email:+set}" ]; then
        email=3D"${KBUILD_BUILD_USER:-$(id
-nu)}@${KBUILD_BUILD_HOST:-$(hostname -f 2>/dev/null || hostname)}"
fi

cat<<EOF

%changelog
* $(LC_ALL=3DC date +'%a %b %d %Y') ${name} <${email}>
- Custom built Linux kernel.
EOF




--
Best Regards

Masahiro Yamada

