Return-Path: <linux-kbuild+bounces-2577-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A263A934131
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2024 19:11:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 575501F22630
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2024 17:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BD891822C6;
	Wed, 17 Jul 2024 17:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XxcvCn22"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1248D17E914;
	Wed, 17 Jul 2024 17:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721236253; cv=none; b=txCjNDN5hu62QrqUIFNGSpkWhYtIePxDPBmi5iBiCct5rnhNqeTOah1SLLE81aLSfEOEvksrNcB5ntqu+97bkRTvrbBB1Nu4gxzKwvAlHiAe37AJmKOSbFBQGuqfFHnnYaALBR1QuxUJzs9YAStRM4q/oZNd6WONz09MyCdp2AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721236253; c=relaxed/simple;
	bh=rdwLVdAcuVzcNwPVby/FE3DqQTTKdp9BIHny1OdDSTQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K4WH77GKILeGdVPvjBW/NFHUU9N23prLDbJ2yl8MI7mxwcESfMAhjzaCVk/ST/vVyF8Rd+a1/QnghqG64VR5Mw8TRD7c1A8sdrK/AhZVV3vCDQwPfzLAGVDRPN0TBEP464o7THq+jiyb2ZOpwRw/RQhcImd2gNvQAkXCRpmoi1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XxcvCn22; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D74A4C4AF0E;
	Wed, 17 Jul 2024 17:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721236252;
	bh=rdwLVdAcuVzcNwPVby/FE3DqQTTKdp9BIHny1OdDSTQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XxcvCn22e1gnnvRM0Qcrl+FK7rpvFbzKhEbLFQBFNWJ2rYp5vcXevcOyJR8qHesVT
	 9bC6zZzqCRlax+Be0xbOF1lPofyh5hQQHFXzU9+EgJ6mYrNPPs7o2d9ZDW5fO06TOk
	 Wmedbwp2d8+YuUhhmlJyA0J0kMEfK8vrdyiyCMChIjPdkumu2bhmXKpouRHbSnVz34
	 WxluqKALHK0QVpIHymS4DbO1fs7Jx3jq8BkNxz6wFDUaPdJgGNMgqzhwRFfTucZPoA
	 qkiV3PMc+wj8urP9QAjGygzW0tTehasEqPJxmhwUIvkOhJpotb8p0wR9doZpCPTsmN
	 NcsPl5WoJTYGw==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2eeb1ba040aso133681fa.1;
        Wed, 17 Jul 2024 10:10:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVFJLtyh/iGr+l+pO44t/JgZspxltSDRyvI0W9wr7QDrrl5WYCf88EP0VIeLaxv79GP+gvm8OyBplYSynsZdDQ1kImX4lLqsP8N5HX8
X-Gm-Message-State: AOJu0Yz2mote4bugQuxQQNYFwYiHoVnViJ0Mya+8xN3u+xtrUJZrXIK1
	eeekqcDDjAHBqo+LKKIWjWSupoq7ihS5fc+KjZ4XyB1JcAX67CRh22eJNkR9LnraX7ke45qtiE6
	DyBVpnt5FX7Og+z8fLsBLnYiZfZE=
X-Google-Smtp-Source: AGHT+IHVYU50P4CxFTJFTmIQlZWbO+YYYsiB7t+XrmYTvjBUl+U6tsMmYIplBhbkxY5hEkp7N1HV8XBxDEkZOT21gv0=
X-Received: by 2002:a2e:3018:0:b0:2ec:140c:8985 with SMTP id
 38308e7fff4ca-2ef05d43972mr213241fa.36.1721236251500; Wed, 17 Jul 2024
 10:10:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAK7LNAT_b6hmN4W94D_7o5XZAc7jYhBi5rp=GUE=y+_BHjccGQ@mail.gmail.com>
 <20240716122505.3425582-1-aquini@redhat.com>
In-Reply-To: <20240716122505.3425582-1-aquini@redhat.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 18 Jul 2024 02:10:13 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS9FfGmB9aPL0+b+dUUH0v0Gf7tho1tE293szEQ3x5u+A@mail.gmail.com>
Message-ID: <CAK7LNAS9FfGmB9aPL0+b+dUUH0v0Gf7tho1tE293szEQ3x5u+A@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] kbuild: rpm-pkg: introduce a simple changelog
 section for kernel.spec
To: Rafael Aquini <aquini@redhat.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 16, 2024 at 9:25=E2=80=AFPM Rafael Aquini <aquini@redhat.com> w=
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

Applied to linux-kbuild.
Thanks!


--=20
Best Regards
Masahiro Yamada

