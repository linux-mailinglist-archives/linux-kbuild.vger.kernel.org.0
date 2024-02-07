Return-Path: <linux-kbuild+bounces-865-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CEF84D56F
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Feb 2024 23:09:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1054C1C25938
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Feb 2024 22:09:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A26F012C7F1;
	Wed,  7 Feb 2024 21:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="Y9aMcX5W"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A434813849F
	for <linux-kbuild@vger.kernel.org>; Wed,  7 Feb 2024 21:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707341617; cv=none; b=WnceyNI99LTM44s6sGkg2cJZB4ItZHjhgWKAgEKrRXp1CL5inFrzwkoF9iuSgXC4I1XHb/B7NrX9JJ/ULmT9qu01BuAANfskUWghroQw6J7tHKKTxjas1m7ghqwFVfZrwlM0uoYRfMU0xyha97CFua7hbUSA+eKWcwGux+uXk44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707341617; c=relaxed/simple;
	bh=6BOpcg6okTWPFWaIYtqUARu47dDdOBDQsvIoMbwINeo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ORht/lvZNZwbXrl4oDebZtBygbMpCeE4/AklTN/xalLAmRKFz7hnJ4QKIt3nXjv192uPEQKDHWuczv9x8brZxYHaIehUA5n/CuLO6vyMQ+iKz0KNe0IO6re5OvyHXNnu+9/5kbcmMFKP40CYLIPpjtqO+8kEhmMmgGq9ImvHJEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=Y9aMcX5W; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dc6d8f19ab3so1260572276.3
        for <linux-kbuild@vger.kernel.org>; Wed, 07 Feb 2024 13:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1707341614; x=1707946414; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6BOpcg6okTWPFWaIYtqUARu47dDdOBDQsvIoMbwINeo=;
        b=Y9aMcX5W2vl/VGu0yDEs+EPk5WXBHeaHsV7WH5dAo1UtFcSmkB9ibDRkosr6ZgW9xD
         2r11FustAYoTBnt2DFhfYN5yB7671yDlPzSN9o7h/IpXi1k+OFhkSJM+NE/OyCSiNJgv
         jhlt3fIKps099WYsPRzHjyno2zvkRaDNpkwg6sCiHq/NulrnAijIOVeYrH150MeyZYwo
         IBnyNLa2V5ZLolWAlZdg+21EwzHyL7fnOgP/iZCFcxQxN1KcTkssH7C/MWZVHOM14ofn
         dkCeiPZr/glr3FxxM20e27b3cqmOkdZ9xBu8JqwH3Sn3cdIk7LNV++i6M/NlvEXfC70R
         Rv2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707341614; x=1707946414;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6BOpcg6okTWPFWaIYtqUARu47dDdOBDQsvIoMbwINeo=;
        b=viDDgywL2G62NUtsVs12Oe6phQWH6UpID8axLY3tEHQF8Qwh6cR87J/rR1oxoZtIoF
         hmaFz92sIAPcIPZf28Cvvp0SYEXKIVWl52+ml1FmInNyDMnevKxla0mGpNUa1Qs6E4qK
         S3PRS0/ChReRyHPT8IA9ny9JBjPsjdXYb5izXwXelp8BxJ4ybOaFr2CgsatpwJeZkVXm
         IKgxDF8xIOuFA/xRji34BX+lDbwNNAG8Tuw8ispRpcuouaBAtE9kMnKi07Moi/WYpS25
         +59ML8gA2a88bhMQiL8Z2kTRky9iBjcz4xZaEsfK0htO9fZYyEbd3DnMO0BO9ZyJdMbu
         Yz9g==
X-Gm-Message-State: AOJu0YxFKYz3AWLmGzNfdLDonIG9mkidvHZRRV2C20nSeEfeoKptE18q
	oX42HuxcUV0FcAKpdktIMgOeZkGh2wwiIjlQJ1JiZOMOhjJYPcQT+Fbuecw/jiaQ/dKIrXQR3cq
	jH0858ci4vvsRy5YTtCjvTkEN0LLLYHM8PgbX4w==
X-Google-Smtp-Source: AGHT+IHrYG+/o7v1J2J3dpFwsVemFTwS1qmwD738Z1mWPeHiWxDEFgNdegqhyiNG9Feb4jofcWgOJdbWEuL4wTlAYM8=
X-Received: by 2002:a25:fc0a:0:b0:dc2:53ad:9a3f with SMTP id
 v10-20020a25fc0a000000b00dc253ad9a3fmr5899264ybd.27.1707341614524; Wed, 07
 Feb 2024 13:33:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240207055558.611606-1-tahbertschinger@gmail.com>
 <CANiq72=00+vZ+BqacSh+Xk8_VtNPVADH2Hcsyo-MPufojXvNFQ@mail.gmail.com> <qo637rxuw5tcskmgubutpe6dfmhhms4d4pjivzhewl5tpg3eth@xil6gpcvdiya>
In-Reply-To: <qo637rxuw5tcskmgubutpe6dfmhhms4d4pjivzhewl5tpg3eth@xil6gpcvdiya>
From: Trevor Gross <tmgross@umich.edu>
Date: Wed, 7 Feb 2024 15:33:23 -0600
Message-ID: <CALNs47t7AumxuhUorA9XRhd2s46Gu25k4tiX7RtCGxKhnCuuKg@mail.gmail.com>
Subject: Re: [PATCH RFC 0/3] bcachefs: add framework for internal Rust code
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Thomas Bertschinger <tahbertschinger@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-bcachefs@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, bfoster@redhat.com, ojeda@kernel.org, 
	alex.gaynor@gmail.com, wedsonaf@gmail.com, masahiroy@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 7, 2024 at 2:57=E2=80=AFPM Kent Overstreet
<kent.overstreet@linux.dev> wrote:
> [...]
> I didn't see that comment, but we're mainly looking at what we can do
> inside fs/bcachefs/, and I've already got Rust bindings for the btree
> interface (that I talked about in a meeting with you guys, actually)
> that we'll be pulling in soon.

Is there a branch with the bcachefs rust rewrite or WIP, whatever is
intended for upstreaming? I checked at [1] but nothing there jumped
out to me.

- Trevor

[1]: https://evilpiepirate.org/git/bcachefs.git/refs/

