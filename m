Return-Path: <linux-kbuild+bounces-3930-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B386A991FE4
	for <lists+linux-kbuild@lfdr.de>; Sun,  6 Oct 2024 19:25:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C1482809E4
	for <lists+linux-kbuild@lfdr.de>; Sun,  6 Oct 2024 17:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0465189B81;
	Sun,  6 Oct 2024 17:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MQyuMQ/a"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86242F9E4;
	Sun,  6 Oct 2024 17:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728235516; cv=none; b=iIuu7xNHr4v6mgCgnzziynNrkT8+JwHCBPB7eW6tB5OgHZTQDCpU5UrEEx0F+AeLx4I1qcC6jByrGfQjql7BsthaLdKwOiDCzSNzZoNWb1eObTgzMjodrEJj42XOfdg0oXVkBKCzO6iefyZsmvUSUjlpWfmalmmFGQGlZKdAF7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728235516; c=relaxed/simple;
	bh=i8XgxReESpSMnrfon08suU+V65SF9sHPBWPllSUMl/I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m0wtNdDYokERrDklg85jXBJSfWL2i+4AJbKnZvKfOsB3R/0DwiIOJYTYBbGjH/mUHXc/ec2wlw75HQr8FJxqD3sDKX6rr8rveXwomDUHJaBGQzNwd7izlSp1dL3wNJN9fT2I6QCrVf3qJKugxzbRZ8qTspVvzestSpwi1XyybF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MQyuMQ/a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 100FDC4CECD;
	Sun,  6 Oct 2024 17:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728235516;
	bh=i8XgxReESpSMnrfon08suU+V65SF9sHPBWPllSUMl/I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MQyuMQ/aDLBY1GICvOmNOkZA7K+ZYMeiugzeLNVF10tKz4j9a5KZULcl0kEMdUO9l
	 rwIWTCgLknSwwfNgfrqksgceEyJ4Zt6T76RNiupMsQMxYVL3YD0b8SjTTBDcBwiVA4
	 m4JjW0v5RJkoH2cIb50xKzx1fvAe2uvprQNktV9iltEO7ahmGMuzySrNTtMM+APO95
	 J6FO5wTiTsH66gWkNZxywcNMWgwrgX63Cql75o5n+7FnzYTaxtH2auIxhI8WjRG/dW
	 jszVorpnedUzSiyfPXpPH5Zy4ocJRAASZYuPVeswn5tP7YutQzv0MEyJS1kM8QQPjz
	 WGPmb2ZlTTJaw==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5398e7dda5fso3574567e87.0;
        Sun, 06 Oct 2024 10:25:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWvgHCd41MrWaV9C8Lq1hSSjXEe69Kr/xP1hhb9vWnEG0a7/XSJx4VocHFfZLQ5mWwAjigRR8nYy4MXvspX@vger.kernel.org, AJvYcCXGFQsxzUvz845GQV9wovbKia/wqgxUCh5GX2IpqTI6+gROCwSW14Raij1JOxioPdt5LdGWT3Np+I916FE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTwNVa9Yn2Bf260bCDyoFavezXTflZQkqb0N1Ct/t+OJ2PlC5H
	QhV3KnfXyuXKQ7A74r7f3BUklChBhTOlM6SkpNnOQuvrpw0crDqqZ9A2pjvN2h8UZ3sw7XUX/Yv
	oFnL9kjuPvJkYD5m3xy4/r9OAAcA=
X-Google-Smtp-Source: AGHT+IFcXrmU33l1b7EiZ75ABx04q/wNOhhIJqu7byBcRzWlWweg3OiLg2f2Dkkl8oGFWhyGYvI0Wg5HlzcDCfs2O7Y=
X-Received: by 2002:a05:6512:1155:b0:536:54c2:fb83 with SMTP id
 2adb3069b0e04-539ab877115mr4642833e87.23.1728235514778; Sun, 06 Oct 2024
 10:25:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241004075245.169046-1-dev@aaront.org>
In-Reply-To: <20241004075245.169046-1-dev@aaront.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 7 Oct 2024 02:24:38 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQBagfFwWBrr61xS1H6igcvNx+xt3PRK+4J5dsdBAZLDQ@mail.gmail.com>
Message-ID: <CAK7LNAQBagfFwWBrr61xS1H6igcvNx+xt3PRK+4J5dsdBAZLDQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: deb-pkg: Remove blank first line from maint scripts
To: Aaron Thompson <dev@aaront.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 4, 2024 at 4:54=E2=80=AFPM Aaron Thompson <dev@aaront.org> wrot=
e:
>
> From: Aaron Thompson <dev@aaront.org>
>
> The blank line causes execve() to fail:
>
>   # strace ./postinst
>   execve("./postinst", ...) =3D -1 ENOEXEC (Exec format error)
>   strace: exec: Exec format error
>   +++ exited with 1 +++
>
> However running the scripts via shell does work (at least with bash)
> because the shell attempts to execute the file as a shell script when
> execve() fails.
>
> Fixes: b611daae5efc ("kbuild: deb-pkg: split image and debug objects stag=
ing out into functions")
> Signed-off-by: Aaron Thompson <dev@aaront.org>
> ---

Applied to linux-kbuild.
Thanks.


>  scripts/package/builddeb | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index c1757db6aa8a..404587fc71fe 100755
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -74,7 +74,6 @@ install_linux_image () {
>
>                 mkdir -p "${pdir}/DEBIAN"
>                 cat <<-EOF > "${pdir}/DEBIAN/${script}"
> -
>                 #!/bin/sh
>
>                 set -e
>
> base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
> --
> 2.39.5
>
>


--=20
Best Regards
Masahiro Yamada

