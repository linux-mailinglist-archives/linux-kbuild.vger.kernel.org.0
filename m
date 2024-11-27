Return-Path: <linux-kbuild+bounces-4905-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DCF9DAFF6
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Nov 2024 00:53:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A481281970
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Nov 2024 23:53:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4975A19538D;
	Wed, 27 Nov 2024 23:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GeG7vUmN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19EE815E5CA;
	Wed, 27 Nov 2024 23:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732751635; cv=none; b=QTxMAIZjg32eYz8TiHx3voCfpFDYH9mwsUeCH+8ENjKVQuqdGs2Pt9af2NOSp8cLm0NBsGOywZrhO8aknlA9QzuF1ZnS7MagbT8vMukULPLxwLgY/N8wUXxyVkXmA+U9C1RRs52IeaoV2PU/zQnwUbOwftIpIpvs3cUNibEQEUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732751635; c=relaxed/simple;
	bh=kiqiUHGZQKDYDLk9fO3maDsxVcc0F+gp/DU8rZH1+FQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gW/8kEX8u0NeAvYEVNuPe0UADVw9CH9eI7GSnOwpAmufE21LKsyTy7JEFc7MzqnSh8WqmpCXfGGvPAUGE+IS5clbFMtZckZgxhXEbxkomb/ndl4I+tQFpB7bXSCVfkeCw/aH0YK/YCvBwclr1KSzSi2ezb2nCjL9SEIfx9jyF3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GeG7vUmN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D001C4CED4;
	Wed, 27 Nov 2024 23:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732751634;
	bh=kiqiUHGZQKDYDLk9fO3maDsxVcc0F+gp/DU8rZH1+FQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GeG7vUmNZxbSth87JooSfMF70IdT3fmdmMXXf3fotyZKM4wDTZKySh6/5dMAENZG+
	 fQSYLbqMyRYMmCkBitkqzLK8OanqDV8g4hL8G3ktzy12e0uHSsKnAoK+ull1W/Qrtm
	 winMgGo7shI9dK1PMEGiYmzxwRXOIWUGwJEE1x7Eny5Ura6yST/t+WESAttYWhKVNU
	 EzcN2TCkGTwCzHwgVfMoA/aUZTABc6qB/VzMdR4jObHzc5B4B5Hm+nrg2UePPTBIND
	 0//7C4UTE2M9bPDtYYrCqrwKCi07Ukb1R+xEdNYoe0VaN6LS27LVjLSrdaBmkdWfc4
	 kfh7Xyp8EDsHw==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53de5ec22adso233749e87.3;
        Wed, 27 Nov 2024 15:53:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUTeYMrN8/ZFzLNEuNy9eKAc4hv8C6MOys19tbitvHXwiFAzZtuvzHaGOBx1zp3HtuYGU74lLbyqb6LzkU=@vger.kernel.org, AJvYcCVpGQmBlxJAiu1gWm4e85a3VYz/MoqQ3Qy1pF4U9abk66JnVZAn5napMmHTkOuhYJupFnSGdcNdZpWlo0MC@vger.kernel.org, AJvYcCXLDiiebSqQvHLd6+7f1QL3elgzXz4Dka/Lxork6TlSjNp/+yiJj0lzkn7j2Ygnj6BAOMxsCHrrHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmZCZLdN//JWWdUc2rZpxQpJ7oyg4+vQPllKpyh2cLZhDk2pAQ
	bey5PLo/diK2K6POeoe7F5oxBMXHEfGTDOpzl6ybuSLSOKvynXY/QZvajG/y0aIXosd5CZVD6rG
	SYoCgm9OlmYRquR0xWOYkb5qdFC4=
X-Google-Smtp-Source: AGHT+IGCxQxyu7QI4OzPAUT0z2wKT6cIjeMzPvwQlBLfhKTYIg/LEjqElhB370EqPzFIOc43+h4829TCnjPUJgXQ+N4=
X-Received: by 2002:ac2:4c45:0:b0:53d:e5c0:b99d with SMTP id
 2adb3069b0e04-53df010ead6mr2748857e87.49.1732751633236; Wed, 27 Nov 2024
 15:53:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241127-selinux-clean-v2-1-a6e528c1ff93@linutronix.de>
In-Reply-To: <20241127-selinux-clean-v2-1-a6e528c1ff93@linutronix.de>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 28 Nov 2024 08:53:16 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQRtzeUQq8W6GsSJsA5jq4cnn4=-Cvz=J_tZeb-3n+A_w@mail.gmail.com>
Message-ID: <CAK7LNAQRtzeUQq8W6GsSJsA5jq4cnn4=-Cvz=J_tZeb-3n+A_w@mail.gmail.com>
Subject: Re: [PATCH v2] selinux: add generated av_permissions.h to targets
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Ondrej Mosnacek <omosnace@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, selinux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2024 at 7:09=E2=80=AFPM Thomas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de> wrote:
>
> av_permissions.h was not declared as a target and therefore not cleaned
> up automatically by kbuild.
>
> Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
> Link: https://lore.kernel.org/lkml/CAK7LNATUnCPt03BRFSKh1EH=3D+Sy0Q48wE4E=
R0BZdJqOb_44L8w@mail.gmail.com/
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>


Reviewed-by: Masahiro Yamada <masahiroy@kernel.org>





--=20
Best Regards
Masahiro Yamada

