Return-Path: <linux-kbuild+bounces-7776-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFB1AED3DB
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 07:31:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D66553B305D
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 05:30:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 653571EA91;
	Mon, 30 Jun 2025 05:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CyszqC9d"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2F020E6;
	Mon, 30 Jun 2025 05:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751261468; cv=none; b=HckyOmdL5xmc4H+OxTVlT4swq938e2o7Q6bqQMeXZLD7L5WmwWhiMsB8ZJeq/hNo4J3abSiTyV5pohrBOnqmheFBb3AMrcSWgWNb+60zc/HzMZ072jybXOqkI3fnxo2ie1qn5sP54rMwAkMSHxnDz5CCsiC1HOQHweXAE69Yfjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751261468; c=relaxed/simple;
	bh=wOUFcXzvFy9tLNDn9KCMEkittBH/iIuIUh326k12JYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eyDzmHbnSec6QoBSkKpDiUAQOI1frpL3AHbcDpmYJACyfDuGMkSzqYdZwirCBB3k2r1EcgZDPiLkDeU7EME+Ucmejs193cg31vSNTAqUH+v5XUvwSzdwmUoZCaNDTza1VmwjnQ+9yhyIAUrPCmv7WUfO5gW3fU0IR/HqjwnoUk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CyszqC9d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACCD7C4CEE3;
	Mon, 30 Jun 2025 05:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751261467;
	bh=wOUFcXzvFy9tLNDn9KCMEkittBH/iIuIUh326k12JYM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CyszqC9dKy/+4MBr170/sNj/Pvsz+p+lE9yEmhuvXfX/9RVRxkAllFFbRP3wDyc/J
	 B9812K1MSQ+zHDSGGKRxvtiOtBPM9/rQHPc4NXs8QvpCaFMUuX0xlaRJi7E1tIRJG2
	 OPN5TDRaTdSqiHB48Ufs5ndIRa6E4O5t5U+NlbB+5pKPRk1o2LjY+hj058qstDbnr2
	 xOfFBhuoRsWrYCYz4hPF6+46BvnPMQ2AK4AlqFlqMQcjP3CoBYPKMUx181uf2ld4AH
	 YIlUyBRuBUGJkvVycstjeZOygLTn6ZvIaI2uWySRo9vx1d+iMzL3CBGFTtqptIXhld
	 1+LMptwlmQXDw==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54b09cb06b0so1575176e87.1;
        Sun, 29 Jun 2025 22:31:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUsfeEdilCoTJX48gCLzpMvfEGzLCFrkGLxnDb7+eki6InKErnLpzoBJU3U9EZ13tjcm+i41Gyev2NKMeE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGH5MWlAM55w5rPlwZtP8T5vgh9UjjA6WdkBj+p9Cui+Ee0FzN
	YwmWaO3bh0PnMSs/zK8OSIlvIsQ6n3NIzWnDigQr61cvp+FlK3YRo4x03P7/BZdbCEjfyMSOA1C
	ftVNBRtn6QCq7tvOLKd3uMAZ85Ba3aFE=
X-Google-Smtp-Source: AGHT+IFSia8jJnntJYEMXraDsNj+LDIyR6rgATG75xsdndcK3Td2HRSvghQtkOkG8f55g96FUPT75cc1wFLXiTRsja4=
X-Received: by 2002:a05:6512:3b9e:b0:553:a4cf:2106 with SMTP id
 2adb3069b0e04-5550b9efea2mr3061775e87.57.1751261466406; Sun, 29 Jun 2025
 22:31:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624150645.1107002-1-masahiroy@kernel.org>
 <20250624150645.1107002-54-masahiroy@kernel.org> <CAK7LNARxjFmzeP8-B3JcUbYaiJF_cKe_VNbX_f-WYqW4E3mbNg@mail.gmail.com>
 <02fb5ced-8ff0-4bc3-9c84-c2a2594f8b25@infradead.org>
In-Reply-To: <02fb5ced-8ff0-4bc3-9c84-c2a2594f8b25@infradead.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 30 Jun 2025 14:30:30 +0900
X-Gmail-Original-Message-ID: <CAK7LNATo0kK+DqUS8ksCjz+k=QFr-Xt66q3rapuAOzw4eVVgCQ@mail.gmail.com>
X-Gm-Features: Ac12FXx7SQHytqVfiSS4SVQmeL4uBkQGc7bNwBeY61J2pvApYzqvi8y1cUn22C8
Message-ID: <CAK7LNATo0kK+DqUS8ksCjz+k=QFr-Xt66q3rapuAOzw4eVVgCQ@mail.gmail.com>
Subject: Re: [PATCH 53/66] kconfig: gconf: use size_allocate event handler
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 2:23=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
>
>
> On 6/29/25 10:56 AM, Masahiro Yamada wrote:
> > On Wed, Jun 25, 2025 at 12:09=E2=80=AFAM Masahiro Yamada <masahiroy@ker=
nel.org> wrote:
> >>
> >> The size_request event is not available in GTK 3. Use the size_allocat=
e
> >> event handler instead.
> >>
> >> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> >> ---
> >
> > This has a regression - with this, we cannot move
> > the horizontal separator between in the right pane.
>
> Between the menu items and the message area?
> That's what I see.

Right.

The horizontal bar between the menu tree and the
help message area.

Before this patch series, you can drag it up and down
using a mouse.

With v1 applied, you cannot move it.

This problem was fixed in v2.





--=20
Best Regards
Masahiro Yamada

