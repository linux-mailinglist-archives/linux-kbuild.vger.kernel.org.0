Return-Path: <linux-kbuild+bounces-2535-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBF7931880
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Jul 2024 18:33:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A6AD1C21706
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Jul 2024 16:33:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E48C1BC41;
	Mon, 15 Jul 2024 16:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eJi9qQNO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139221799D;
	Mon, 15 Jul 2024 16:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721061215; cv=none; b=bLQWH5qsdQgdwmje4428aqdgWEeOpyRDfeb2mfVs9q1ffctSQlSc5OMGaVIq8RKY0VpmLnREjzEBtxvzT+eVHaMYnf3Q4/mdf9KN+KkBRv2mBdmmF+pGdYy6DiwHjvG9DH+hQ21sfgFmTVYaufTce/ojC2OSjlninwB3/toqssQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721061215; c=relaxed/simple;
	bh=YsIOJcIzCtgQUy6fe55s8xuVMYV7qKmns+jvyZ6BX98=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LXrzfi5lV7AVDzvtnXtAfJwXvJrlAMXJNomsyCJLDNqj9FvNi9C3Whn2vSp+RyInDAvwhRvlUULjjK+8fLg66CuMi4vYjDfan0LJiieKDCQc4XZAn1i82JrNbpeSPV86Rkc5ZQmmBn6VRE+zQiAKVIXTWRFYngCRCbtwirrOLDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eJi9qQNO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A45A3C32782;
	Mon, 15 Jul 2024 16:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721061214;
	bh=YsIOJcIzCtgQUy6fe55s8xuVMYV7qKmns+jvyZ6BX98=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eJi9qQNOYkDbOnnDyFX3LlRWuUQr2Z9DtaHKPd+qfxqY5BKRTr9DSoQD8E5BwBjYW
	 oYsX5GhHmeTPpctFgu9RCef+kycfZMySnfoTcOiUXTdegme/0cWjU4MQIfyAHNuefR
	 QawZxNJfjiEZ1Azk2MxqtEuYeOzRIQH1+3L9vgrmU6H8EVUZiGLFX3PzUDAvPzlrCI
	 b+yhS2KA/TVmnM1HXY6bSCrzQ7yGiZnSI5awLI9sYjXDptAfLBpp6Qit+t3zwsI0o1
	 2hIySplPkKaZRYd1rhzwkExp+It9vE8H9wB1ycocBDPoXTi824UGGjY3vVNAHnLfda
	 DWXqitPhX6uog==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52e97e5a84bso6307316e87.2;
        Mon, 15 Jul 2024 09:33:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVzwTcpeww1DMCZa7WG7c/GcZhz0K7sAs7G6V9wI7CWSxwkE35eeYRyKnB8CSCZLzgxTPEkt9R961slOSneiX7yw976fjDtIFWD/g4i
X-Gm-Message-State: AOJu0YziyX1t7JlJurUgGUyIMvagKEl/cpa7HpPBk4yGsV3HJlzEc65/
	jswHXW5CPkpMqHuXVkuS3lqETU0iknYG70yYvtjSf4HT84mj5+ePCBEJXAvBL/s699Wc6Wb9zDK
	6uqjTDbLL11UZpFmwpU8RaUaDlXE=
X-Google-Smtp-Source: AGHT+IFFyBH1ytHJ6hQjzAIUeC/mABTAKPhjNDEzrbj9W7OXNTVhs7juvEl1JOmDtjaVH3rE9cK9osEdLrjN7lLc5lE=
X-Received: by 2002:a05:6512:130a:b0:52e:932d:88ab with SMTP id
 2adb3069b0e04-52ede1a5643mr49993e87.23.1721061213250; Mon, 15 Jul 2024
 09:33:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAK7LNASzX29R38ApwByCO3kpiY6-L5UqHnP1Vs2WRBQM8z+kQw@mail.gmail.com>
 <20240706164423.1934390-1-aquini@redhat.com>
In-Reply-To: <20240706164423.1934390-1-aquini@redhat.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 16 Jul 2024 01:32:56 +0900
X-Gmail-Original-Message-ID: <CAK7LNARATMy4hJ=Jp0fLd=JyD_SRC5ok8CFmLwHPv7kam4Eq1g@mail.gmail.com>
Message-ID: <CAK7LNARATMy4hJ=Jp0fLd=JyD_SRC5ok8CFmLwHPv7kam4Eq1g@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] kbuild: rpm-pkg: introduce a simple changelog
 section for kernel.spec
To: Rafael Aquini <aquini@redhat.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 7, 2024 at 1:45=E2=80=AFAM Rafael Aquini <aquini@redhat.com> wr=
ote:
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
>  scripts/package/mkspec | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/scripts/package/mkspec b/scripts/package/mkspec
> index ce201bfa8377..e45fdb12fbc7 100755
> --- a/scripts/package/mkspec
> +++ b/scripts/package/mkspec
> @@ -28,3 +28,26 @@ cat<<EOF
>  EOF
>
>  cat "${srctree}/scripts/package/kernel.spec"
> +
> +# collect the user's name and email address for the changelog entry
> +if [ "$(command -v git)" ]; then
> +       name=3D$(git config user.name) || true
> +       email=3D$(git config user.email) || true
> +fi
> +
> +if [ ! "${name:+set}" ]; then
> +       name=3D${KBUILD_BUILD_USER:-$(id -nu)}
> +fi
> +
> +if [ ! "${email:+set}" ]; then
> +       buildhost=3D${KBUILD_BUILD_HOST:-$(hostname -f 2>/dev/null || hos=
tname)}
> +       builduser=3D${KBUILD_BUILD_USER:-$(id -nu)}
> +       email=3D"${builduser}@${buildhost}"
> +fi
> +
> +cat << EOF
> +
> +%changelog
> +* $(LC_ALL=3DC; date +'%a %b %d %Y') ${name} <${email}> - ${KERNELRELEAS=
E}


I am not sure whether the version is required or not.

In the following guide, not all entries have the version.

  https://jfearn.fedorapeople.org/en-US/RPM/4/html/RPM_Guide/ch09s06.html


If you want to add the version, perhaps is it better to
follow the fedora convention?


The spec file of Fedora looks as follows.
The version is enclosed in the square brackets.

%changelog
* Wed Dec 13 2023 Augusto Caringi <acaringi@redhat.com> [6.6.7-0]
- Add rhbz#2253632 rhbz#2253633 to BugsFixed (Justin M. Forbes)
- Turn on DRM_ACCEL drivers for Fedora (Justin M. Forbes)
- Linux v6.6.7




Or, is this not important because there is no strict format?



> +- Custom built Linux kernel.
> +EOF
> --
> 2.45.1
>
>


--=20
Best Regards
Masahiro Yamada

