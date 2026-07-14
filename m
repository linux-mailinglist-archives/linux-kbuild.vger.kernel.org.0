Return-Path: <linux-kbuild+bounces-14004-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CP1yFyQAVmrUxgAAu9opvQ
	(envelope-from <linux-kbuild+bounces-14004-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Jul 2026 11:23:48 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B34EB752CE6
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Jul 2026 11:23:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=TMDKrAY9;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-14004-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-14004-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CE71430D0B92
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Jul 2026 09:19:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8761E43DA2E;
	Tue, 14 Jul 2026 09:19:28 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12CC043E4A3
	for <linux-kbuild@vger.kernel.org>; Tue, 14 Jul 2026 09:19:26 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784020768; cv=pass; b=cBGSqPBaeolXRGxHx6H9BWBl9MJ50G/ZbokbRh4xx3bgtjlPCeUnydLNYTbJ5oy6gychlB1lHzstX5ZDZ7nA99gHBe6tDerO7JLp93pQWXmyhetgs3E49yBHSx0lLtm7kSYI05hR2D0dBLJgCde5MMwiuHoV6glpGpFGKt0ioa0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784020768; c=relaxed/simple;
	bh=1+6OfoIbXmuIEVoIyX1bMPQc3AaQ9LY/ZItgZpQFXXc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UgbFlSMXodqeiJBOoxBUpcQOD9H6r89xE93QYo4Tnyw38/BE/1FxEwIsFIx0NTWzkesT4arHX13JKSkK24wIrlLrktKsnnb7ZYEbPLEiahWtFzqTq99hVLH96P2YjNIUO1Y1wYV79jYztbGYCsDIjPWt82nHfLyedHwQWrEqNzs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TMDKrAY9; arc=pass smtp.client-ip=209.85.216.52
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38dd1cc8dc8so259131a91.0
        for <linux-kbuild@vger.kernel.org>; Tue, 14 Jul 2026 02:19:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784020766; cv=none;
        d=google.com; s=arc-20260327;
        b=qYVJFg7wnenhle/8ZzrC/fCr0/FXbUySthBg5mk7LvsMivPlkHCT2lN0uZH5g1KBmT
         TyTsY70Tbc4JWRLeDrDTDm3arCAaLqV8CPdx5eabwiVjT1wcyicWX3zAcSJgYeCVKOPH
         YZ2NpjFcj9VGYXunTcIjkoNykuo38nB7dBgr7Ng3AaCWEDjkvb+DfCZEpxREbvOWwc6F
         2bDGGEeyQY7yrUWY1u1wQzr8fs6yFqfA+ye6TleFm99f4eChfv4G8gwynDji1WJdVDoD
         GCP9GUDP8/+swQ/MzgWlEfJHk+G//wbDA68OxlQ/oYwrNVqkbzX5ejgV+nfqKaFfNsR1
         eZDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1+6OfoIbXmuIEVoIyX1bMPQc3AaQ9LY/ZItgZpQFXXc=;
        fh=7uQvEIyoA0kqiXFwxHRQQASMusi6YMbshHb+2B4lRuY=;
        b=eor3lt219xViUp6mAQAmcq8SmdvjaJN/aovmOWKu3iCtRtG4Vu1Plx7J7a+cT7TqiG
         iGdyCCmgZXmvKsjfdMiERJ1gQf80prD7N1cYvSiDdaDnRlPYAf41cJkjyMObffA8GPKQ
         q/Ccw132l/OyOcLKIgogXVMosty0ZW/Qb2QbqyUY1ctIRzvbQHzKfQp9wtqfM4e1bR4f
         dn6ewuryvrUuZ8V6pyGRx9hskx0sQHJ1U6IFKUJAeowExrvsNdS6LcKryaRo96RyN6pB
         EGmu9GfrFMpKYomBT7NAkITH/5Nku9qN97KdsqWsIb0uqwyjDx/TTMknktxL8Xc6QuCN
         lJ6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784020766; x=1784625566; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1+6OfoIbXmuIEVoIyX1bMPQc3AaQ9LY/ZItgZpQFXXc=;
        b=TMDKrAY9USx2GyQWgV48IQXQOMPhSoywVqYLHrJK0vFg8F4SluLxulW2Ic1qDCJGXN
         2+wSasQMStQrjT1KgoMQRIOXX3vCn42S9vS6p8rzI+yyMtWuhXpyT/5sP0AHkrF1F9+q
         h6icAzuqIMdWZimxjFRO1yL+Iyx1wervdi7gt1xMX39/bdr2JeHgdkhId0Odmvrs62/j
         /xplJ/SIr0pGLSgp4G0aQ8l2OCuqpVqf6fsz0Ilgt+3NeXtBzdhmiiXl22AsD+t9nysn
         mNFkWCoAo5o/keiTHYZZKGm566PAuPSvk6Ac+z8u0jynsO7oXTBJUa3x51UFNu5r753i
         pBQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784020766; x=1784625566;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1+6OfoIbXmuIEVoIyX1bMPQc3AaQ9LY/ZItgZpQFXXc=;
        b=boJVnLMETwwX1MiTnNg9idUGH0hE77vD7/9+9vgFvnNRXk67FY8n9tyiB7s9u+MYkh
         vNRrSBstyjOsERIcTyZAAjbb/cbp/w5ahUReJYIIcRvU0eDDSJAlzXlU3Oe7wQr+c9iK
         Q7X7JM4EY8IQwH4hFMchOfJKGxWjdHzCbj0AsJOMj0+UwYApkY53QJlWiT9gA+ZgofIE
         2H/wfftF3ftu6UiuvxpPgl0orJBrR66tiEAaCJERvI11bf0txnhtffs2p+iGf9j/VLbX
         /qEKmlz6TsajJ2QX/k0UOtQnH/wuOcb/DTqsJn87K3tQPyJHd2hdzm95yDrN+toqDYHu
         tbmw==
X-Forwarded-Encrypted: i=1; AHgh+RqUAjEj+rCq0DQSq8Bn27hQMT6lcMCQmgOXwANm71VRrMXKa2Pw4Q9+ikW+wRdvVtmUDifFK22qbgb2BXA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwulQcmqiKsfqpE2ZLcPZn12J/7hMe04KPXJmj+93QY72GyKXmS
	IEGw9y+cR3SLCBOA7aDpzEErtksGkfg8wy44zioBLQIXP3fGmLTY3U3eCBVWbO1oydstlFPT44+
	KADVe3vIxKIkYzjgwGwA2OL0xQ6lTF+U=
X-Gm-Gg: AfdE7ckPIMJVGgc7SKk9QlnlDDyckbu4BCOmTLiYsdl3hc6aBk1HojRVLGjkzQUc3eB
	BUMPMKDX/mjc6NVbuxpAdLD21qx3/K7fI3qi36De3pH4UJykf1zgCfkXnAtZHjWFiAGTkyjEk36
	czuNx8tO2mv3dElTu3/O1Qj5sKgkMsSV4cXBd12duVi5Xbs7wkpJlheF0LnU2A1NcAjGN+8iMAM
	jRKW2U2uNUXyAeSSrG30k0BiD6p1xPbbjJZ06Bo5w18UcXOpKkVBU5oXW5XhaHLNgX8FzLANkaE
	DmETmxJQDLkjkRYW1rBm9okw6s8sPqimek2wyleX3iymylgV++6Fg9HIKHKmTA4KUKPNx0XkN+V
	LoFWwPVURE6WbJN8hxdJTZGY=
X-Received: by 2002:a17:90b:4c02:b0:38e:bfe:81e6 with SMTP id
 98e67ed59e1d1-38e1a9d90f9mr1536708a91.1.1784020766402; Tue, 14 Jul 2026
 02:19:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiq72kHbVQfNrum5D2a5sCd3mFQHNtigrQxP1WW=YcggxA=WQ@mail.gmail.com>
 <20260714083709.69517-1-litvindev@gmail.com>
In-Reply-To: <20260714083709.69517-1-litvindev@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 14 Jul 2026 11:19:14 +0200
X-Gm-Features: AUfX_mxhVU-rpFvO4T2J_6Fnb7m9tCvhM2LiAWJbL3xu2TTk-JxiIQfVMXQWuLg
Message-ID: <CANiq72k0RbkWk=8hiNzHUmFWr=6OA2DBHAUew4OfZb_Umb=6hA@mail.gmail.com>
Subject: Re: [PATCH v2] scripts/tags.sh: Add support for rust source files
To: Sergei Litvin <litvindev@gmail.com>
Cc: ojeda@kernel.org, nathan@kernel.org, nsc@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:litvindev@gmail.com,m:ojeda@kernel.org,m:nathan@kernel.org,m:nsc@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-14004-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B34EB752CE6

On Tue, Jul 14, 2026 at 10:37=E2=80=AFAM Sergei Litvin <litvindev@gmail.com=
> wrote:
>
> Cc: stable@vger.kernel.org

To clarify, I meant this one for the other one, i.e. this one sounds a
bit more like a feature.

But I am not sure -- to decide whether it is a fix, it would be nice
to get a description of how each of them breaks something, to decide
whether it is a fix or not, e.g. the other one sounded to me like it
was a mistake because it added extra unexpected files (and I guess
that could in principle confuse tooling or perhaps makes `cscope`
print non-sense in some cases), but does it?

Similarly, for this one, what breaks "in practice" for the end user?
e.g. is there an error message, or does some workflow break, etc.? (It
would be nice to show it in the commit message if so.)

Finally, if this one is a fix too, then this should likely has the
Fixes: hash too.

(By the way, if you send a new version, please Cc the entire `RUST`
entry if you don't mind).

Thanks!

Cheers,
Miguel

