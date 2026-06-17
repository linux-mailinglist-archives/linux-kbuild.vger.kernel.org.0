Return-Path: <linux-kbuild+bounces-13798-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id otFTKCyxMmq+3gUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13798-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jun 2026 16:37:32 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 605CB69A989
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jun 2026 16:37:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=pdsabbkO;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13798-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13798-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DCC8E3044F45
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jun 2026 14:37:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 214C343DA2C;
	Wed, 17 Jun 2026 14:37:12 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0589436344
	for <linux-kbuild@vger.kernel.org>; Wed, 17 Jun 2026 14:37:10 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781707032; cv=pass; b=SJhF7G9+JzoNsdrN452kqDvA6DQSdtmjliFnOR1sNInFFLPT0n5UEf5lgu77hIWcICOFyJz/eXYkujW6xYNQrsQktmvjxY3JSmmJcm33YLOIvZUdl1Lv2i8Q8S9+KJIF7dpe63HA/3oSYdOYjw/LYSoSwrL75NVqf/KIr2KSHGQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781707032; c=relaxed/simple;
	bh=WvOSdL7IT4BD5SGMbOIMchEGBxxRSiSItC1+ME6H0EI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rfdksgdagjHvVUlrV8iyIIGPr/sGOGf/5qVcvvg/gEzups2GpGbllEs8hUAFcY5VI/pdaUG5F0AYOlIWvWnvz2Zenwo3LOTeWToRmNYDDmqeJvlatmZY2NX5leCT/DeXBWvSRwqyrb2hj/4paSSH/i9ohLm60wXMrYDTWuuFDPc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pdsabbkO; arc=pass smtp.client-ip=74.125.82.169
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-304f8e80b7eso451296eec.3
        for <linux-kbuild@vger.kernel.org>; Wed, 17 Jun 2026 07:37:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781707030; cv=none;
        d=google.com; s=arc-20240605;
        b=adg0f0zuKytceg/SBU8Pm3lldCSpzqBVrKhwTffBLP/hDjAt3+fCN0tOg54Z7CRuIe
         NYgpR4uWKA+qNfDCO08Yzi9yPLXRxA6KHLmzb/YHSs5JqMEM8ytUefj6ZOypjGJzJQt+
         ssU3Gs8V7QDKhmE036NpyksK1H4UysBdLILMhICPj2up1maexIFapciBwQOXIk7QzLCQ
         C+gYqvkjwAB0e1NBwGJI14i8OdyvklAp+RA/lgc49Danb9VQy4lqpQazDjCT++Z8QpNR
         NtdFHQ/kYdM8WfIMp24vh4oopBwQz9HpaASAPiMIqufGdhita03CePMEcEjyrFgH9Jem
         jXRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WvOSdL7IT4BD5SGMbOIMchEGBxxRSiSItC1+ME6H0EI=;
        fh=9AIodxVP2IrXIABUfR4E83cagLkffYEB7t0xn4akacw=;
        b=ZwKfBEM21y08cbcyMvV3SG8y05fP5ltLf2fbHnCMaYL9JAIkvoChs2fdVGJh/Do3Gy
         fkEboWqkWZCWJtINIkjBCvsLt3xQA53dfcGcgs01xc57NA6aWQkWMD2qLcRI9R46w78Y
         Lb+FyXPb76JQn1te1SVkrIGMv0iQuOLyUC2UhESCSjXLu4aVpFPFbXmRhw6vzOmP3P9y
         7eQWHX0Kdn/9m1GVJFtpW1eCHRPCN/X+vKy94QmZxGnSkWGZ0OMyK6PaT06IU1Wns8Te
         B4MgLzEEwz2VylIwhM5uOJydHH9F4c5P9G/f49euxHBbzBVgqK59r74rrJk2KYw0J+AA
         E9Jg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781707030; x=1782311830; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WvOSdL7IT4BD5SGMbOIMchEGBxxRSiSItC1+ME6H0EI=;
        b=pdsabbkOWn++PJ67QfnbzTsK2ubYKMXqu3r65IOzlFcqaJhstP66VL+fsp6FoP93zr
         WM18jWJQKJqr6FkiKjCna4YF7iIZIYif6flT93Vgh3ujM7jpyb+VZrLsn/G4bWL1lqCH
         EYGXXKPpe1I4tNiFKm2Qcgv2vwnKBeNYz2vkkkreeCRMD8ebAA4XzWrv0KiEDQK23Poa
         CAgKFz05/SgBoNFupchVS6KYO+zyawad0rAUq+gYACMLkOkpAuvJvU9EuSAdRYS+YKY5
         PsFDYYsnWsrZatOh9cmX/bN0P1mg5nURtEJYBvbcuCNAvIV8FFcCmbfBOhmDVp3taS5j
         OYhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781707030; x=1782311830;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WvOSdL7IT4BD5SGMbOIMchEGBxxRSiSItC1+ME6H0EI=;
        b=Geli/Vq0R4GL5oksjTu0FenNq9Z+ZBf1H/fdvS/S3RqSI3wzmWJwE1HAG7m+m2tqQv
         RiDBHXo/xR4vkSd3zJU5jeZEozSN69lqThf31JsZOKT51c12V1lFGWHvGLdbj81ew2Hw
         sDqAi2vUQ+2x6I9xyDyEycZpT65EEB+g28vgR9CHrrydtbQxCr+q/BPlA1GOWL+PKLTb
         wJfvFO8H6acMZV/T32aSv28lDkqbfnT/7naJBk/AtkLHh1Mchnoii6g5OGZ/khUVsB6b
         a1iV+BWCtfVyLyUr1pl8fbeCCtUIj8Fd5AonfoHyItvBLoRJiUu8lPgMCzLn9rso07hI
         GDoA==
X-Forwarded-Encrypted: i=1; AFNElJ8HXdPpzKNogNXr7JyTXzNRugLeUavRLeyHCYN3Xu5LPgkwuMJdUAgoBDZ6wk1uxNL956YznWSYp7dFyfI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQNHkz11UU6MfYKSBabFhJoiI6xVLPt13fmpnMnjOgc1CSrRWg
	iPBrnsd35UtL5mn6PIDWKBRuznmIzs/JKCdOJCzxyLQIikA3Pavc9qBvtHv2LfC4E50q05GYWez
	rHAJCkWmjVZlvGSAbcmtn2zN3tFApaHc=
X-Gm-Gg: AfdE7cm0o6oHzpiXIrrt75vLwjczv9BTp7DRcwHdp9zMWakPOqbmz6Of5CJeTLtH3nQ
	BaZuWiI7Yg5iAY4YzOMetKFLxh9LXnnEtfQGVQ3qJXpFMBjWV0Y0ZM86mifQ0wChmGC22O2eJ2U
	XejszyilIOwJsbqxEBaA6Qs4nrdUNhiWKxKdx/zp6QIJiINWvOmrHehjGdg9uLlD54k6sNVgOz8
	ntV6/tIH+mDOyWI1836GGACSsAqFendKrYSl61nBzh4sdiyCHwZdbeQpwver7tgoJ5RK/7MiFKL
	rxHpPhK5jL2oTexED6hiIYOW8bmz5tI7NWTafHwswggbMZYU+H5cVBnNiz0wEvB4vGPArvaCyQT
	6qr4FAbIQ5XIlSYbQU22Capw=
X-Received: by 2002:a05:7300:4311:b0:307:2e1c:17ed with SMTP id
 5a478bee46e88-30bca09b8a1mr1044490eec.7.1781707029963; Wed, 17 Jun 2026
 07:37:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260617-rust-kbuild-replace-procmacro-extension-v2-1-667bdc3a6435@fritz.com>
In-Reply-To: <20260617-rust-kbuild-replace-procmacro-extension-v2-1-667bdc3a6435@fritz.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 17 Jun 2026 16:36:56 +0200
X-Gm-Features: AVVi8Cc3S7n8hC-xspAVluZVnzwmntF9uAMPFU3aV5PhGFJBNsOfbMKyf_GJzPo
Message-ID: <CANiq72=N=TPxuEjKo7FZOUBTNaUEqdvNT67UDeuA51eFcqLPyA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: kbuild: Replace and dissolve procmacro-extension variable
To: Nicolas Schier <n.schier@fritz.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Nicolas Schier <nsc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13798-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:n.schier@fritz.com,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:daniel.almeida@collabora.com,m:tamird@kernel.org,m:acourbot@nvidia.com,m:work@onurozkan.dev,m:rust-for-linux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:nsc@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,collabora.com,nvidia.com,onurozkan.dev,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mail.gmail.com:mid,fritz.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 605CB69A989

On Wed, Jun 17, 2026 at 4:10=E2=80=AFPM Nicolas Schier <n.schier@fritz.com>=
 wrote:
>
> Link: https://lore.kernel.org/linux-kbuild/CANiq72nmPPF=3D6AUp5mcDJVni80O=
RQr0AQ-4uCZaE+CzB5kV=3Deg@mail.gmail.com/

Great, thanks! I will take this next cycle unless you (Kbuild) want it
through your tree.

The link quoted above could be nice in the commit message, I can put
it there when I apply (or is there a reason you want it outside?)

Thanks!

Cheers,
Miguel

