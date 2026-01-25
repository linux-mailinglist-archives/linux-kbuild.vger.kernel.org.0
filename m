Return-Path: <linux-kbuild+bounces-10861-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QL7JI/k4dmmTNgEAu9opvQ
	(envelope-from <linux-kbuild+bounces-10861-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 25 Jan 2026 16:38:33 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CB681481
	for <lists+linux-kbuild@lfdr.de>; Sun, 25 Jan 2026 16:38:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 69041300F9E1
	for <lists+linux-kbuild@lfdr.de>; Sun, 25 Jan 2026 15:33:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E579B27467F;
	Sun, 25 Jan 2026 15:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AWkBhcaE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75276325488
	for <linux-kbuild@vger.kernel.org>; Sun, 25 Jan 2026 15:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769355222; cv=pass; b=Et45LB68xtToVNfKVhW5+D2bFWQJxlyfwpscwFZkmtyyEi2WWB+huqRIIHuWFaeAXyrSpjWcFCBDNdd6CCYq5zV5xrCcvZ8Mhype1/tjrCUALsN4VYtlpDuRyHnJKdbTT2iRU1d4V3SDML0X9pLThuEd777X9Mgd4oaz7PTfc9o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769355222; c=relaxed/simple;
	bh=JzFxjsr3KfdNOjnsWU15LVPEs1szMKNW9AHW9vPvBCw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hd9V2J8jVimjKq03WSkELIuyaUau09oP3WVDteQMXkz9eZcMJIsbA6hvLYANgLsR2dw5gdpuVS7+MKrC3NJmjy+F+CetjAx9R90jCYbAvBV7dVj/1w//sJXM/JpROcwXpe8h767dCUi5xgb0I15LmYwvaEPj1KdLET8BsBCoS2U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AWkBhcaE; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2ae5283dae8so215211eec.2
        for <linux-kbuild@vger.kernel.org>; Sun, 25 Jan 2026 07:33:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769355221; cv=none;
        d=google.com; s=arc-20240605;
        b=EarKUY6l+cw0teyMfbRyGETJPKjW9x5HGSfgN0Yes7jRsYlODeo/YSeQZWu/pnEt4l
         yWvgTdJRm+nNOpspQafPKgRUvfXtG9Vx27YUel6tiq0YW4CM5zmo9iwghGM/2w97+bYG
         OZ6Jn44IFwrfw/qYFbc7EvSB/zru4LA970sGO7YpA8BcAViLqCc2uhMarVOplxV4o9Ou
         ajPfOYIPF/5BEKVWMbvTye/pXTxFT9dHODoRFurje5xKrEHEL7qXQBjhRh2sJL7nB0so
         WjSnAH9JhdYH8e8WLA5JQDedPmKDap4LWcLk4UbOqyjzPXiPsWa9BtZO8kOPjoqYJBmM
         xtuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JzFxjsr3KfdNOjnsWU15LVPEs1szMKNW9AHW9vPvBCw=;
        fh=VqOe4WTdqzlNmu+D0gyYGTtdvXKBl88pMYRb5iTOq6g=;
        b=OmhHEG8Z7caWIxQXHuSYaoNRlSGTCw3DGCRcClUDrJvIhQqv8KafyqTw1YFr3NttW1
         B43VCgF5QlPwMHHsOxX+OfXuyXU+R04P4SHVJCU+Us5fE5Cd1bwlDWABO7CgKTpX1pQu
         hSIp9fcNopTmA9P1wToKAYZytjV35UiP38Z3cAuC1UO7dZJZv34UZy40sas6e9e5IVsD
         M53mvS4TxLNJJfcqOAUObcaxAutXZmiegZCHgNBPlLB4uMJMU/uQc26Rval/9qi73+yt
         TGXfuGH1qgQkuXpGVv2Z1dSqIQ8WJE1FXjQsCMGDIki0XPO2G/aDZqb8aWAzXik+YPwx
         MECw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769355221; x=1769960021; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JzFxjsr3KfdNOjnsWU15LVPEs1szMKNW9AHW9vPvBCw=;
        b=AWkBhcaEBZunJjDQ84pLjwVuHHNZBnht3dfmLzzUGAAnnNiWusm9hv6Y80WP1pBwPb
         zDz4gFg54cHn/05Z94WwQuCUJIJlc0UU3ml77ap05C/UmI7jwUR9fPI+lUNtqE+L+Ndu
         ApMdAQ34pPD64y17kAgNjUadL1CU+pSdE5LD819RDHmrbkrs4RaO78J2fO3vrW147UaD
         OZw30x3ziv2507lkgW3tsi4wC8VTki2a9YSCe9w4eXSRl6GbNUr6zBXzTAO8sRjhqktj
         GpvLtTnHczd5tdK5QP8bxbNiGCYJfyEo+vrmjYYYr9T6xCR+yUPLsYXN5dkmCnGSCcc+
         UXlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769355221; x=1769960021;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JzFxjsr3KfdNOjnsWU15LVPEs1szMKNW9AHW9vPvBCw=;
        b=a79tm7Xhj68c7Ytxic2TUMHB75gKgp4j9OfFHT2hqPTvpW+upd2U0Shmbu+bvFASyc
         pzSZxqrg78BDGce0oTWc/iMcTfTg2zFrksEv0tvlGmypnF7k6z2nXrb7qq2zZ1E4gV7A
         hf60jOqe3sAFCCDJAaIf5L+PHLE4HeW5ZLIshgmU6Aj8xY9dKXA8exFthdtyB8yX4UXb
         apgOzHF26x/XSyUT2tBWWRRvNjiEE77WzdYwrQ9NPGJ6w5gxLfHZA+q6UVLUxHqJeQG/
         /bawgoAHG4jTJY5GP3M2cPaDeiMF8VNDv8M0CnznF0LarY+2+4F6jHRalg2dP2wKomcL
         ImZw==
X-Forwarded-Encrypted: i=1; AJvYcCVVdLCCPqpgmxYHHVM2gYb+g7oV4hPejUD1h6s7oKUpNQc3/AesVqjrYT1NNJX8PZxtJPRqcuhqf4kgnyY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx//CfEGvc8PpdaxZdLLmd+LKqiLY2ryoPI5kkGiqutIah8Ylh
	MsaTi2cLM62elAN6VJnciyeFvqR6Th8lnCcwjVbgTrWOCCYlfc/G/25u6IvkxpKr5RDZlvSCPJG
	BBMnR5ISAbtsDD/3AIBohmQovpEEnvZI=
X-Gm-Gg: AZuq6aLPm8qVrE1GQDTxCGnsSg6+0Q/auz2Por2Zv9shYeoVSAZAJszW5p5JortabKX
	fxXiEhHVq2S6ZLKVmFAQNTskugtHlDOZ00z8tJHhHEHSstV5vsSRoanaHkdArYprby5+Ew0QW1u
	jQniC4baVmEwIx4pKcYhqTUtxzqfm7d5TamiM6Mhap4krcMWqULy2YWR2gRSqRwtwXAWfwPxZaO
	7nCZe0kjifUsdg325eFUgAD89xowKyJQpWDVZHGWKx3M8ej05XXYUhY6lxNr5OEcFzhMmoqo6l0
	2cNnm2kN5dFDHn/FXclcD4rYkTDsJhPLVIJo9c6V6T9AvL4GIhFk/xYCGZj9KT4MHXsFjnJiHle
	6BC4roiTQdmXT
X-Received: by 2002:a05:7300:2316:b0:2b7:20bb:8c23 with SMTP id
 5a478bee46e88-2b764828f33mr406227eec.8.1769355220509; Sun, 25 Jan 2026
 07:33:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120115352.10910-1-luis.augenstein@tngtech.com>
 <CANiq72mtWhjVNNYc6nvxuQ3XAnMWBDiZyOvJ1BNN=M+097Wvpw@mail.gmail.com>
 <2026012214-magician-mashed-c84c@gregkh> <CANiq72mcDqAS-FUfkAnxa7OEO4Kq6r6=uvhEb_UW4sGattCOuQ@mail.gmail.com>
In-Reply-To: <CANiq72mcDqAS-FUfkAnxa7OEO4Kq6r6=uvhEb_UW4sGattCOuQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 25 Jan 2026 16:33:28 +0100
X-Gm-Features: AZwV_QhMygd40leFE2FE5bVziebUyapoJlruSD9vRgx2kIQtr2QBMvl3HsAxth0
Message-ID: <CANiq72my2WQm9z_iF46e3Umqt1HZ5gthneXMLP-0VCF8EMSz1w@mail.gmail.com>
Subject: Re: [PATCH v2 00/14] Add SPDX SBOM generation tool
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Luis Augenstein <luis.augenstein@tngtech.com>, nathan@kernel.org, nsc@kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	akpm@linux-foundation.org, maximilian.huber@tngtech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-10861-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: A3CB681481
X-Rspamd-Action: no action

On Sun, Jan 25, 2026 at 4:20=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> After all, the kernel image should not change at all whether there is
> an SBOM or not.

Well, I guess the SBOM could be saved into the kernel itself (and
perhaps retrieved in different ways, e.g. at runtime), in which case,
then an option definitely makes sense.

Cheers,
Miguel

