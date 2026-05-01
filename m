Return-Path: <linux-kbuild+bounces-12970-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOjeDH9/9GmXBwIAu9opvQ
	(envelope-from <linux-kbuild+bounces-12970-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 01 May 2026 12:25:03 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BD01F4AB9AF
	for <lists+linux-kbuild@lfdr.de>; Fri, 01 May 2026 12:25:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AEBA73006822
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 May 2026 10:25:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 078B5386C3C;
	Fri,  1 May 2026 10:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pc9ksghI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50643859CF
	for <linux-kbuild@vger.kernel.org>; Fri,  1 May 2026 10:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777631099; cv=pass; b=sedgrrg3RQnPpAPihtfT5ZwCx0GWCSrQcNJRRmp6vA5CKS7pS3AjlwuYGb1adOZK/xvScxYVajvbhmsdWoNBuzSwQphu1rT6+hcmPNstS0KscG6zbXECIkqKkjYqoDC2+fxJflLOplpKqorfFfnGzL0qXYfywucIYSeBUtvmmpQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777631099; c=relaxed/simple;
	bh=ueeBZ5rv/dNboibk79RP10UA95sIWbIsy7oXRFid3cI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QtWq5ed2l4MAxBiZNptSBjK5o9dN79pFElicqbUumLiOeyPsOCR+x/DiGuMahWupTYb1lk0Slv080Z7OHdF1BrrAmeKpo6hJY0rrzCG4zYJMph/Da34Sv3UcvgtJUqfySREWkvUYPDMzpdZ4qRUdk6Du2/sxxWhzhD9ZoHsy858=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pc9ksghI; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2df943e0a96so86859eec.0
        for <linux-kbuild@vger.kernel.org>; Fri, 01 May 2026 03:24:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777631098; cv=none;
        d=google.com; s=arc-20240605;
        b=CUPSLuKyzZc3r3jI0NA8sdiMuEekc62vMuYZ4UZRqJ75Brw4VJSIqlPvf166evkKBL
         WNKZ3qtautmF9Is5C5vlSKOaKYjGZC+0vz5Z0w2RJ4b0tJx0jJBf3v834vlzkpowq0pC
         53mkYt9v2rvGOhKiPlbAog/+x5dW4h+kRoOdHAuzMp2R7w/QiF75Zz4ERVKAFeXIEmuk
         PSFJAE8LtdBHlemFCT96DSb9ZuGuuk3h0NpDmBOmj2Uw/L1hIDZlePJzkzUnA8hhVnuP
         HBNqevDTzpQKPgd1Fx93GUtKiYeYgC4BgyRlI0/io9nmxcLi1U9NE4k0kOFD149jqckM
         XlLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ueeBZ5rv/dNboibk79RP10UA95sIWbIsy7oXRFid3cI=;
        fh=ECoAANkyQU4aIHQ0Zf3vt7Z3oQVO3JeZlBfzmYMuQOY=;
        b=O3H+YQglBLT/7t87dzkUOn6SXAb/3+w1m8rV7LXk/xG1+MfbqVXHEU3wkMlHucu3F7
         zk4Nj4eLMAhaexIhJI/kfIeTtpH2op6tK0I10eOCAyZ04PnD93KGqsCtw/w5ANuIR7t2
         Cab5n8r2zDgsX02karTJReColgth7TwPOKV5oYX7CI3To67l8BNRoEuj+YxOK8iHveRG
         9tq6dYE2ZEk6p+DyWhb5JdQgb/ea/siS09Ynxdpy8JNMTzRwqqwSJz2IIFPnoPbMAaI7
         olyp4aP6F8MmfKvtFAfMT/V5prjFwuVgB02gv2G0rOSjWlM//9Pn3L/TtIq3simwTv9F
         O0pg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777631098; x=1778235898; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ueeBZ5rv/dNboibk79RP10UA95sIWbIsy7oXRFid3cI=;
        b=Pc9ksghIlsy3Mj5xhgNHIVY3QWJa3GGnUDiQRAMU3scgzDLEFna6536uQAfzFY9MHZ
         orWQd72Hl98oWd0o10YoH5CWlFpzwUZ3k9SWKoHO9jQqCswRZfNsRX6/TJQ4D4juqh2E
         CjDxfQWAiOckhwMu4AO2yTK6utD/rikV1OgxxDi6F10bO+RgpW1vvcLJyydyP/6k5Mr3
         k6ehzG8dR8qHXGDX5QbcIz0AxZKVCqMnpGhCPjtNGSiQTJji07j6jEk7eMGyl8gLl4I5
         zmYqJHXze0Dd7zxpR+LlDVuN20OpiHHzo7gpvxhujr6MDnT3NxBLpjdwJoG1b3Eif3a4
         cUWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777631098; x=1778235898;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ueeBZ5rv/dNboibk79RP10UA95sIWbIsy7oXRFid3cI=;
        b=NlKL8xx6F6JwH2jShDaPN5m7ocPnvm2jRgNJ8Ao98VCoJbeJvqv17HV178mxfykpDC
         dcZdeixjMpOhV+ZKJWg7PluIIYiDMzoazcQJHT/4vaT0oheF052m/8g/YejQGQMeQTGS
         NJ/KKjakauVCh8DC9uohqrzFz6uBNyrlneQ+sJutZP0SQdMpjaq+fULuS+swy70NnJGH
         as1TG+/XgkPt1x/7gUW2fHKFYdvMn22569+3LeniBfRmRVuoMxFL4uTUlbwpGqq03tGs
         9bXKMr+aGBxVm3m26A3kR0g4ifPiHk0TUEVH3YujzxGl0MQkLZXYY3+ryGkbvdRhWhRu
         nFrQ==
X-Forwarded-Encrypted: i=1; AFNElJ/hGdarN65GL4LgE08rv5kjmQ+gqhR81XSwJJynQQ5qB2ydHL+7mc/Ld0feiKy3YhveO4nJ29uOmC/gXgg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/z6CriFY/PDQc+l7/Xsxr5/uD0vlR7oLdh+a9zCi2Y2v7uIcj
	0/0eUeJDN0dofJTPp7QmEnRnSK4QjY0rAi8mtqL8cCbkHIj6DB+L+QXp+lEfNJ2wFd46s4Khb3z
	vywS5erg2B3minoSyUooHraIb6yObVOI=
X-Gm-Gg: AeBDiev82rmrQseY0uS7heXXVxkuNUXU6+Z9nkoOp2qMvr68NPqApMkUCDBO+U8zMpP
	QsI6h9uchMQ2Biy5eWm3Uez20j9IovXmH0jhBrt3wdjjZ+V2SMPTw1Ud9miSE5b5cxiPSBB9yhU
	AWKUpTJWnsskCv8RI58AF/uY3qwq9/2h92SC4ErAlC2p4PfAeXcC2XACxeWFQDvaFDcv0SQZ6aD
	6+sABuNBw1NWGZDJLCOWmIc84wXfrp1pfqVH8AN8aBRC9R7GRdla6YYCowO6kHQPt49cMvOXhUH
	Kny3bzVk0eRMbA/3EjDTIhJEARzdBnKvUsRanWOBfYyEgqnNxJGCO3+OYjVRIICyo7VPw3k7CTZ
	HGAAhtBXeLcQDIcd8jevH2OWgr8VsY80+7g==
X-Received: by 2002:a05:7300:e128:b0:2d1:9b35:4f03 with SMTP id
 5a478bee46e88-2ed3e67f9bemr1559146eec.5.1777631097781; Fri, 01 May 2026
 03:24:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430-nova-exports-v1-0-7ca31664e983@nvidia.com>
 <20260430-nova-exports-v1-4-7ca31664e983@nvidia.com> <7a33e348-4a08-4f80-aa6e-c684b4d7f1c6@nvidia.com>
In-Reply-To: <7a33e348-4a08-4f80-aa6e-c684b4d7f1c6@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 1 May 2026 12:24:45 +0200
X-Gm-Features: AVHnY4JU-fOQK36-2tr5_8MPKm5fMckRl4BPWEv-q30y-1R-UoCYMfDc0_YhnfU
Message-ID: <CANiq72nuGa7x21DcKr22ghi8bfrbATrBhcq-40zQ=3XJEVV8tQ@mail.gmail.com>
Subject: Re: [PATCH 4/7] gpu: nova-core: export Rust symbols for dependent modules
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Zhi Wang <zhiw@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: BD01F4AB9AF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12970-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[nvidia.com,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,ffwll.ch,vger.kernel.org,lists.linux.dev,lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,nvidia.com:email]

On Thu, Apr 30, 2026 at 5:22=E2=80=AFPM Joel Fernandes <joelagnelf@nvidia.c=
om> wrote:
>
> How does the rust compiler know that this function can be called external=
ly if
> it resolves to no callers within the translation unit?

Like Alex mentions, that information is what the `.rmeta` files
contain, which are generated by the compiler and consumed by the
compiler later on.

They contain stuff like generics that you point out, in order to
actually use them later on, as well as many other things.

In a way, you can think of them as opaque, generated "C headers" with
all the information needed to build later crates. Other languages take
similar approaches.

Cheers,
Miguel

