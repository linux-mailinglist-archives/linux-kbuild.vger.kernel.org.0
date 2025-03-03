Return-Path: <linux-kbuild+bounces-5946-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 213DAA4B7DE
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Mar 2025 07:21:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9DBE216B107
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Mar 2025 06:21:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 020911DED79;
	Mon,  3 Mar 2025 06:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qliio8Al"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7B41922E7;
	Mon,  3 Mar 2025 06:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740982856; cv=none; b=JKw7IkCMG5ZOv21kwq8o1dc4NVD8y1uk1nU6Y7CdWobC2pYXJl0vZYVizw9yb2Iyh4EfUhZTwzHXTwnsNmph6+JF5DifTysyxr0QEUhPlHIXMkvtS1lSjzDnJrD5Z6OZYH2N2iPC/tih2yYREZaApYeb/EoX8SJI/32kPW2c1PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740982856; c=relaxed/simple;
	bh=YxsSUxBLyCSsC53KzBRDI/WaIPEpMKmsZkSuKhaLsMk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HzRz3wmWlZ53FekHHUULnbX2ECsNyiYsDOUakjnhpn6heClAcaAwhBvXY0B7sH7KPxVbDrjHk95sntiBU+2RqckqWsMb8ckbWyYHgHR88J98E6asPCeZPiKOqMtfhBqmKCrbkDFxDVP5/3q7BwfXC4GbtgFNmB30dmbV8oFZJ8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qliio8Al; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42965C4AF09;
	Mon,  3 Mar 2025 06:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740982856;
	bh=YxsSUxBLyCSsC53KzBRDI/WaIPEpMKmsZkSuKhaLsMk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qliio8AlSwkwUDhFD19fcg+s/f/h4VAhcwTdcveaEgwd8I+mcCm9dqx2/PMRyJDEm
	 7zDJPMrpYSgZ2QRmJ4EwG1iYgZxZJWnCiZoY7LV+h88af0VqnRgKLtehIiVCE1hL8k
	 PK5h4B0tPBTFsL8W5pqn5EjP9k+/M3miArK8OPAR4UqINfkmNtx+NawDnG/nCn2jGF
	 nPPdK/wrHeqFd9HDQlbstej3UCzsgamYSdRY2hP25JZGQcc4howVepAWEws5QUkSvL
	 DtCTYI/MGKg7oNt0zzhHlFSH+0XTg44NlGogqcCszZKRKj/lcUhR/WVM7Sm9KjrgDQ
	 TT0iAmH59fJNQ==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54838cd334cso4829143e87.1;
        Sun, 02 Mar 2025 22:20:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVlkgrOnzZW7Hoyh+3Y9YJM8v9GpLL4lzKjssZwyVxQLUv7JzEekwABwqjdOa4QOxjzN0yvDn2bT4c1unE=@vger.kernel.org, AJvYcCXfy9Td8bySEyOhH1gdWR0+Txych7WZ33Ybn3rch02dLqNZFR7FhjZmV1KJF8ZDqJHYJMJRSQox26GzeegK@vger.kernel.org
X-Gm-Message-State: AOJu0YwALt1NvhzNZkERzqRHJQT0ILsytJmIIhQBclBLCTiEnceL4xD8
	sISMP4xW3r6ID9WX4KcrZWXKWrNcHIjNgFWmCwFgeUCdtyy3QoHgnMBEIO14Zs1N883k5XmKG6r
	N4cGvuox6x8xTKd+hXYE8fnylFV4=
X-Google-Smtp-Source: AGHT+IECzc880+2ZhsoYswojrfBflr3IA73A8o9seqOMFsPOINysmg/LKvGErfUdq8bRj9l5XiJi5/m4H40rxP1D5Pk=
X-Received: by 2002:a05:6512:2398:b0:545:2a96:34f7 with SMTP id
 2adb3069b0e04-5494c32029amr5299803e87.31.1740982854932; Sun, 02 Mar 2025
 22:20:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <DB8BF02DB314013F+20250224182619.1557027-1-wangyuli@uniontech.com>
In-Reply-To: <DB8BF02DB314013F+20250224182619.1557027-1-wangyuli@uniontech.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 3 Mar 2025 15:20:18 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQWUhyu--c0q1ExjtRd1Zi3402TJEp2Uf+5XhJj2veJyQ@mail.gmail.com>
X-Gm-Features: AQ5f1JoGoBSdyGsC39LIzzMopJAeIJAUVFyt73rJP5NGmTrnZZ_zW0k_OhOnbyU
Message-ID: <CAK7LNAQWUhyu--c0q1ExjtRd1Zi3402TJEp2Uf+5XhJj2veJyQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: deb-pkg: add debarch for ARCH=loongarch64
To: WangYuli <wangyuli@uniontech.com>
Cc: nathan@kernel.org, nicolas@fjasle.eu, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, chenhuacai@loongson.cn, kernel@xen0n.name, 
	revy@deepin.org, zhanjun@uniontech.com, niecheng1@uniontech.com, 
	guanwentao@uniontech.com, chenlinxuan@uniontech.com, 
	Shiwei Liu <liushiwei@anheng.com.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2025 at 3:43=E2=80=AFAM WangYuli <wangyuli@uniontech.com> w=
rote:
>
> Fix follow warning when 'make ARCH=3Dloongarch64 bindeb-pkg':
>
>   ** ** **  WARNING  ** ** **
>
>   Your architecture doesn't have its equivalent
>   Debian userspace architecture defined!
>   Falling back to the current host architecture (loong64).
>   Please add support for loongarch64 to ./scripts/package/mkdebian ...
>
> Reported-by: Shiwei Liu <liushiwei@anheng.com.cn>
> Signed-off-by: WangYuli <wangyuli@uniontech.com>
> ---


Applied to linux-kbuild.
Thanks.

>  scripts/package/mkdebian | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
> index b6dd98ca860b..0178000197fe 100755
> --- a/scripts/package/mkdebian
> +++ b/scripts/package/mkdebian
> @@ -77,6 +77,8 @@ set_debarch() {
>                         debarch=3Di386
>                 fi
>                 ;;
> +       loongarch64)
> +               debarch=3Dloong64 ;;
>         esac
>         if [ -z "$debarch" ]; then
>                 debarch=3D$(dpkg-architecture -qDEB_HOST_ARCH)
> --
> 2.47.2
>


--=20
Best Regards
Masahiro Yamada

