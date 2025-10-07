Return-Path: <linux-kbuild+bounces-9036-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C81BC20A1
	for <lists+linux-kbuild@lfdr.de>; Tue, 07 Oct 2025 18:07:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C7413AEE0B
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Oct 2025 16:07:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67AF92E717B;
	Tue,  7 Oct 2025 16:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SUTue0ek"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0588828F5
	for <linux-kbuild@vger.kernel.org>; Tue,  7 Oct 2025 16:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759853269; cv=none; b=rITe8p8vIkFY8CHSIxAeg0Fnr5nztPwcz5JrqIAdHBD6sRFMIP0x0OF7w73IZRST7tWrQOGHJHn/gDdL6e2ZxJG5cobkgNMGmKTxhdbeY3cv8jQfE4m2lBrQYfPucywLJMmyEtu2vh8zrwkamwrG5ogq6xuUdu18QNFMZr9+NLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759853269; c=relaxed/simple;
	bh=n6D0HttFUGaZYPc8LF1Jq4ztKp/Jw8ZhioBsSuc9WYo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UHurDsPrxf2svTA/1YWx9b3qf1qaa7CmmpngfWO/lMwC8jeN+sY+D/a9swMZGMlVyZi2LAgdD9bIFf89OQbF/90G9jyxUYKm/0GSfEOPbHPq22HjFItHyV+nAB6rTMHGizEPnCpzGxEowzSipvOZsq7Csezga0iW/s2TWb81HYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SUTue0ek; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-269ba651d06so12235555ad.0
        for <linux-kbuild@vger.kernel.org>; Tue, 07 Oct 2025 09:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759853266; x=1760458066; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n6D0HttFUGaZYPc8LF1Jq4ztKp/Jw8ZhioBsSuc9WYo=;
        b=SUTue0ekWLgvDdeN/2wXZwzZmmukvr9SdrKw++nzmBSsvW1ccaMLa7cFFZ6eLeQGzi
         BXcJoEHKxWqZkO9nB5llmmZ0V09IuMuN/CK9nGiYQ4NXyLt4X1yBpIeS0XYtvYCjO9nu
         JO2z52isBmWRMcwTYHxCjaxsERHC/kDmqnaKnac+nplpe2m9Gi98U6hzw/B6Swb+SnX/
         zP0OMRPvrVkeZOa2hPwRw72BsGBtdCv/VXomBK9/mnkQt7VCNIc01s11YRyd7zol6TTa
         YbkmEx1wt1hqmzFyaA3QAlCnpH2EA52JuR/zmzi9SdppRytsywefTqct4Jtq+2F7dx7G
         KcYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759853266; x=1760458066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n6D0HttFUGaZYPc8LF1Jq4ztKp/Jw8ZhioBsSuc9WYo=;
        b=NWg8LL8EenqjxPKXVJkLs4FnEpqL6fDYHZPGiEvSHnIIwMa7icy4EvSxqYfs6QkUua
         9hax1R83PtRRTR/I6YFG+tcOg5Kzhj4HoY706K7dlzmgZc5tV/NyPci1zZRKa/Q7+yu8
         x8+Q+E/peOiUE9VRD+oQguo6pEOCC0ju1Ev5LXKU8TEdcigiftZZZlpgoWptB/IeoZvY
         9egUHiIEGua+RsUDK1bISq+AuqTwgiwt2XF4AmJn8fyyVccVHOZVBGR6sHrsXQdH3p7L
         I5bvAEtSqA6A6zgRE8mD2fIpkO5N528m7hGDc4oKl0K+RMYdcHFOVJ9/GiX0e+VhB9GP
         8TXw==
X-Forwarded-Encrypted: i=1; AJvYcCWpU5b8rNs+kWcR8l6PpbkYxp0w7wUvZPxhF+BLQqZrGEEOZFG5g5jmBdoqzadhUrWpsTvH6DJL/oee20E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyF/U83CBRsM4no4WwYCn4KDp3YfqI4yu8r4V8ZXZmZivxpMqJ8
	LMF5o5JBU3pCrZhML92KpbKG8DvGD0WNMtDAvHxa/HTDT6kfwW/KSfxucv3kMobXD5+PDNZMdvl
	+iMjA2DILzaLnPle3U7ULSOGO4p46X64=
X-Gm-Gg: ASbGncvNTsuFc0xAhvzCT8wOlJIzujqoaoa3nFeEXfLg4b8SwAInuse8/DsXsaqGrdU
	Qv5pVCTu8QYkQokn4ghT6v58FVzH8SyYVkqjXiPurAQtqHGlciRpTItQTuXUCFCJZkTivOVpm8w
	ucFmitrfG228Mv1bcTXT6t6p9uUmRjQNZPc5abBfSoijI/wHTZ9qV0f/T4cYqb8MsFkq2x7om7r
	Rww+SihdT28Qu0eWLhgHLiXZTn5qVrN+I2H1eqdizt69eXEA8QqSNXHcUNFG2lAAn9zZBLoHPoP
	NEEsYo3Ws9OY996dgW5/VZfecyyyBTB077ki4w+ET7u6lfmteA==
X-Google-Smtp-Source: AGHT+IGX4ATOk5qSa8XF/bg1OcR5jFMRICbWFQN+A1pMdW/F3v4buQSOfTjk2+k+HDH6mOFR6gB0rg0At/1zxoq01Dk=
X-Received: by 2002:a17:902:c404:b0:277:c230:bfca with SMTP id
 d9443c01a7336-290273e17bfmr1866875ad.4.1759853266156; Tue, 07 Oct 2025
 09:07:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251006-kbuild-hostprogs-werror-fix-v1-1-23cf1ffced5c@kernel.org>
 <CANiq72kZjOwSerDEM517uEVffGYzUhm2Pb+1z=7hboJKuQwBMw@mail.gmail.com>
In-Reply-To: <CANiq72kZjOwSerDEM517uEVffGYzUhm2Pb+1z=7hboJKuQwBMw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 7 Oct 2025 18:07:31 +0200
X-Gm-Features: AS18NWB6sGzobQ6f4uXKXrsdQJYWSp7CxwQc1XjTOn9pRZfgDjPT-w87-63-PdU
Message-ID: <CANiq72kphV5cUwqFT0c=CQdYaeC2EKr=oL703NVyCNRVnbc7=Q@mail.gmail.com>
Subject: Re: [PATCH] scripts/Makefile.extrawarn: Respect CONFIG_WERROR / W=e
 for hostprogs
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nicolas.schier@linux.dev>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Askar Safin <safinaskar@gmail.com>, Sam James <sam@gentoo.org>, Miguel Ojeda <ojeda@kernel.org>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 7, 2025 at 6:00=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Acked-by: Miguel Ojeda <ojeda@kernel.org>

I also tested that for Rust hostprogs it now respects `WERROR` and
`W=3De` as expected:

Tested-by: Miguel Ojeda <ojeda@kernel.org> # Rust

Thanks!

Cheers,
Miguel

