Return-Path: <linux-kbuild+bounces-7085-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7408BAB36E3
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 May 2025 14:24:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3F963A3E2E
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 May 2025 12:23:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAF472918FB;
	Mon, 12 May 2025 12:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="noNXBDAB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B219913635E;
	Mon, 12 May 2025 12:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747052651; cv=none; b=AFnruKC62B62E9m5u9ZjccOizihiAZ1LlWT33otwqdj8tzAb+JPg7s/bgnOj0CS267uWi2nAcyzcck1Jfna7+VIlxmHuPR9wYkz3dfz+Lsnevnlhfhr/5uix5Ovgi1NxTM2cVc3daSdPjNj/YvHA1XQGLIdKOhGSbrSnFcOmzhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747052651; c=relaxed/simple;
	bh=CuA0PRV2eY5uvmxFanRx7AjJOjnVPk5V1XikCu5c2rI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pKSYG20dcEj4sM2+3AsnoXUlB/pgxkrV90Tv2OPq789FzK40SIx3Lc9NhBSclqN0eOIy/tlbTo++0nCo7aYvnQPWNOgrOPa3TWrXCgW6plQqT6EAqHO2KwZvxkVUQzt61zvmIWpjziHazoOqj7yRwqak4tDDp4Txr6l5zs2DnG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=noNXBDAB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28CE4C4CEE7;
	Mon, 12 May 2025 12:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747052649;
	bh=CuA0PRV2eY5uvmxFanRx7AjJOjnVPk5V1XikCu5c2rI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=noNXBDABD/8aCASxMVsFy3wn5dWJSJknLxazlj1fnNwXTc37Q97hEY2X+bGbvHf5d
	 46QjgmuK8EBHn/gTTEq3i9cHnkA7X1gGXECwP9j7RosEqL81US6PiRp96Ns2pkJkXM
	 Aje2i0B4URYE3oZl0PycMzyX10ByTEVHiSMPW0R0kB2l1GXEYH2PlLjw9WZcBQlUYE
	 5P4pm1ZZVoT+zM1M7HsnnAJISvBZPzg0EZVZONHpfL7uM6BGL7J4kVapg5Hd8HabXI
	 CCfIUD43rsZoi1rNluEhQ3oedDTsn7NiKp/0mVZd+K4oR+1Scr6kRFMjnsHmiNnnGT
	 qxq7mu+wxPSQA==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30c416cdcc0so42538771fa.2;
        Mon, 12 May 2025 05:24:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVwaPhfj9Y1u1E2T0sDypV4ccPPAmvfYMZQmxtiZWV2q3P8KiGbHyNzjyFaWaabAX2jBNsyh79TxR8yuVFC@vger.kernel.org, AJvYcCWtjnzJ38JMoz4kD5rb6TxdT1SGnkKp3iGaM8QNK97WTMYuxvZRU7J+cJrUGcuntI4kwUKs99ahegcFKLs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIGI3ms2mJ/i53RDl2xAp1UxScH1IGjXKKxOSJ56kOaPC1pDVd
	Fm/KUnAjbt9jzuFZ7vft7T6VeVY+yVtPgFgNnnK0vn4Lm6RtMMTB3dBONDRTQcxbwCNIKE4vW8m
	3xyui+8m+jTAuz8t2XDMcPyWVeSw=
X-Google-Smtp-Source: AGHT+IFgejYovTU2ziQC6NLwJHU+TqCzJstadHwkOOrZVguS9uC++X6OwuPHYHvGRhI7PSZR29GtlvyQwlajuuW/PPQ=
X-Received: by 2002:a2e:a549:0:b0:30c:50fd:925e with SMTP id
 38308e7fff4ca-326c456a7ffmr48417241fa.3.1747052647892; Mon, 12 May 2025
 05:24:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250510153204.11052-1-henrik@lxm.se>
In-Reply-To: <20250510153204.11052-1-henrik@lxm.se>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 12 May 2025 21:23:31 +0900
X-Gmail-Original-Message-ID: <CAK7LNASYL6VCf_JgT_ks6ZObiR1xdB8HvV0XyYrWLrfYghtzbA@mail.gmail.com>
X-Gm-Features: AX0GCFu6iB3zZBCW96oso2PKpux_Q14JdGCkIHiGi3IPjLTEn_3ZE2L0rfGekWo
Message-ID: <CAK7LNASYL6VCf_JgT_ks6ZObiR1xdB8HvV0XyYrWLrfYghtzbA@mail.gmail.com>
Subject: Re: [PATCH] Makefile: remove dependency on archscripts for header installation
To: =?UTF-8?Q?Henrik_Lindstr=C3=B6m?= <henrik@lxm.se>
Cc: nathan@kernel.org, nicolas.schier@linux.dev, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 11, 2025 at 12:34=E2=80=AFAM Henrik Lindstr=C3=B6m <henrik@lxm.=
se> wrote:
>
> There doesn't seem to be any purpose behind this dependency, and it preve=
nts
> installing x86 and mips headers on non Linux systems. Doing so is useful =
when
> building a cross compiler targetting Linux, which requires the header fil=
es.
>
> Signed-off-by: Henrik Lindstr=C3=B6m <henrik@lxm.se>
> ---

This clean-up makes sense.

However, I could not understand the commit description
about the non-Linux systems.

In my understanding, archscripts is not required here
regardless of whether it is a Linux or non-Linux system.

So, the following description sound good to me:

  archscripts has nothing to do with headers_install.


Could you send v2 with the simplified commit log?






>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index b29cc321ffd9..0234faafe8f0 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1366,7 +1366,7 @@ PHONY +=3D archheaders archscripts
>  hdr-inst :=3D -f $(srctree)/scripts/Makefile.headersinst obj
>
>  PHONY +=3D headers
> -headers: $(version_h) scripts_unifdef uapi-asm-generic archheaders archs=
cripts
> +headers: $(version_h) scripts_unifdef uapi-asm-generic archheaders
>  ifdef HEADER_ARCH
>         $(Q)$(MAKE) -f $(srctree)/Makefile HEADER_ARCH=3D SRCARCH=3D$(HEA=
DER_ARCH) headers
>  else
> --
> 2.39.5
>


--
Best Regards
Masahiro Yamada

