Return-Path: <linux-kbuild+bounces-9453-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C2DC42640
	for <lists+linux-kbuild@lfdr.de>; Sat, 08 Nov 2025 04:51:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 967E11884748
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Nov 2025 03:52:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 317EA2D0C82;
	Sat,  8 Nov 2025 03:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JL1EyyCj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDC81A9F97
	for <linux-kbuild@vger.kernel.org>; Sat,  8 Nov 2025 03:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762573902; cv=none; b=aWADV9TUlQySNYxB8A04OhEco5xXcvRKVJNCk34IqSLc8ibdNMd4Jho34SbWGBeKqTX25+hpU12BKDVc4H7Py462030ECgl3wXQB/UawKktUQL6tfQOIy165NQ/qFhwRCqIyN/oYpE+x67LDnkOYMJXjPsU750qh2ItosXMo4p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762573902; c=relaxed/simple;
	bh=q0snDR8xQE/MKs8/cvlLIB/+XXsMPIC+6i7g2yHZzn4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lErsfA5CB+E1uJ7OjDNtHFny6Xym+PUblwxjIu883QR3Q5+Dx5xFr1m6cGjAVNu3P+fhMVj2LBUF72cND0PlkuBKmPyEi5vq+d5RHW0fHiAwCuqzkpqy24pzs2cpJFMfqMEDx6U4+97ZJFxLALxR4BBF260EwscL4US98NveE4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JL1EyyCj; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-297e2736308so298535ad.1
        for <linux-kbuild@vger.kernel.org>; Fri, 07 Nov 2025 19:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762573900; x=1763178700; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q0snDR8xQE/MKs8/cvlLIB/+XXsMPIC+6i7g2yHZzn4=;
        b=JL1EyyCjAu4FD76MI62hxbiXz58ajDEwaLHhf9AvdWC0YzucChlJG9HGdw4gjhqpqS
         oK2Djh/BPstXaoyiofO7PAMu+GwSaZWrpRVEs6wlEQ6Kh+MNzS+PlgkxLFLm92fzv+b9
         Q3N5Uk0qP0zwPYQKamnXOC+YQQ7ANjL192xrKpqexPI/KBj3hmnq+BlvS1XWD9p3twAS
         TDMYgYV7H+I7A5k88u/gU2MKLMX9L96+EByOpbk4vJMhj8urZx72ZKZHlLgUpB7uNqbk
         QneJP/dF5ONvfO899/FjmMeNNg5wypeAyIaMN7MIzKwhkrwZ1CCNwDt/XAmfxGR+S5wy
         +TdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762573900; x=1763178700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q0snDR8xQE/MKs8/cvlLIB/+XXsMPIC+6i7g2yHZzn4=;
        b=tcJHW7/GF8SRDdNuGVoei1Rs4kblwFZtlylRFvnWu1iVbMMinDyQ43GhkcWLLpD30d
         1jcV44uFngkYipUzacayzGedbpIHoCVjHiVDCj2MnTTO7rjTXDtPVNNKYFDpLq2dBAaq
         UbpKQti9fc9zbdJ0+zxTubHywwEokKobuRKgrFsGbki9e6RsxpBkT3Ry2LhIiKTDdhgX
         0cTYYnhbxOncz9wzA9LkukndyI+hj9p4zeLcq8tQ7ZvzgT9jNlpFuiCuQVSJDlXW5P++
         zKnULLvHCu2djWBCpBdLt3TaRwA+IUFDZKw/vfklW+1SR1sdnKtVlLN/u7LIcll0EyEN
         jOTg==
X-Forwarded-Encrypted: i=1; AJvYcCVEHzMinZnc8sBItLqt/yxufiyYhPvxRuV03n9zIrs5YZE8+draQPQJ01z95XdIeR6onKp47h8+yCn4g1I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6OmFEzxLUlBpn+XrnFXTrpD4I/BdVHFSfpI4moOzwOaEfECBN
	x1j35Y1PIpL/uqbFluaN6VU7Ka548RTUUdDyU5Q/DymgfzmqxPVz/0tzxz4bkY31WF+IOGpaJYP
	LepbNsAERdOGEu1nYB4HsjLXCd2a3aMk=
X-Gm-Gg: ASbGncufbcBu7bc1tixlpIhHYe1lX1ElOJVN6oyGNLXvC0FREiAPeVei72HXbDZ9Uek
	BK+RO9UOY3+tze9Vub+QTvHAlhxc3OKIWWVMj3MXFox4k/Y2F+zTMsrVr5oZI11vbtIEp2m9+Cl
	1GtBUnnyOXhckiCV2SWzqj/FM+gfKF0ihYgWGAZyXQ2DHCEJePjHkxphT+VRIy6buENzeOWUaZw
	YPUzcpCAGfa5GCHKmLCfTGbfxUomKwf0A5Ik1eABtodWPh3uuYNRviQctuWDk9C9iHO1fH+VGRg
	qFPw/DwExjzAd5dXO+vs8Dp/qLCBpkL/YmeDTPmuwAy4N0pSSmxnKDkMek9gobFr2HPqNZsQZYt
	KXxeRuhiqQF3VIQ==
X-Google-Smtp-Source: AGHT+IETjy/Whs2XDm6e4xWFe1uDWjZVP1XuxrDCcYFXxquKd3GRTQOQIBFqHWaGhyeM6BjE/k74OlI4YppE1Fy6UDU=
X-Received: by 2002:a17:902:d2c9:b0:296:4e0c:8013 with SMTP id
 d9443c01a7336-297e56d8ddbmr10595185ad.6.1762573900080; Fri, 07 Nov 2025
 19:51:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <b8c1c73d-bf8b-4bf2-beb1-84ffdcd60547@163.com> <CANiq72kX4Yep3pNVq8Ge=txQbPnMO=zKsci5cPgz5LDS=D6NoQ@mail.gmail.com>
 <CABCJKud0G+Xh+Wbtg4SDGvk4Yh5nmt5YgHEPj-H0y8GO5R3Amw@mail.gmail.com>
 <CANiq72mw66ADx7LoUuqY6h9KCU=uFzcNQXZ21kMP7jBjCyyaHQ@mail.gmail.com>
 <CANiq72=OFO8fBpJ6xvGunYrx5hXfcjQJ=YDqFxtMPWDzfzwpKw@mail.gmail.com> <CABCJKue1xeY7CGHScG04PdHT6TOPgsOpZVKWwgzO65qwAcbEJg@mail.gmail.com>
In-Reply-To: <CABCJKue1xeY7CGHScG04PdHT6TOPgsOpZVKWwgzO65qwAcbEJg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 8 Nov 2025 04:51:28 +0100
X-Gm-Features: AWmQ_bnfSsY-GdPkrVyW1DX6qGnfSU4n42VV7Dd3nIzx6h8i36w7aMyP5XChm-I
Message-ID: <CANiq72ncHgjjJ_c2fdTgOO9LxmmotRS8S6pwyckLmPJG_4GPNg@mail.gmail.com>
Subject: Re: Only rust/bindings.o build fail on rust-1.91.0
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Haiyue Wang <haiyuewa@163.com>, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, linux-modules@vger.kernel.org, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 8, 2025 at 3:40=E2=80=AFAM Sami Tolvanen <samitolvanen@google.c=
om> wrote:
>
> Technically speaking, bindings.o still exports ~1500 symbols even with
> newer rustc versions.

What do you mean?

Cheers,
Miguel

