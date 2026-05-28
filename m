Return-Path: <linux-kbuild+bounces-13399-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SC6EGSyvGGrLmAgAu9opvQ
	(envelope-from <linux-kbuild+bounces-13399-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 May 2026 23:10:04 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1069D5FA483
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 May 2026 23:10:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B71EF30027B3
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 May 2026 21:09:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49AE3352007;
	Thu, 28 May 2026 21:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="geXEryc7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B31632E6BC
	for <linux-kbuild@vger.kernel.org>; Thu, 28 May 2026 21:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780002538; cv=pass; b=dSLmPp3G1xavfjNebXJYHkkbx4NMKyAEeZCgASXrK8glBQ4cUMe597XPNRUivr8zHK/MK8CfeBNN2TTiz6pjMO4165e6tYZjblMuQtJdBMYE1Cj+4j+DKQ2YVR3QnPIHhwgAqEInnXHIScF0FoRvwmCChsS0fEE8cEcNdpi6jjs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780002538; c=relaxed/simple;
	bh=s4OOmTRsrwxqAl0aCapSYDllXxyR4c6KCVbQKsao8MA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=utGK36cpAdnbQuEBJ3Eqhrt9+z2UcY659CUJDOWX5aXmH5hfQBig59zPSDa4de5lqJWeagFR5VRd15vicmkUC8dcSQIGYTVgViujutx7FuE5ANSMYrccS+hI2Xc5B9s3d46+TGvZ9pya2SNQMWoLxIq0l3ZXNF10jkCQR4U4MGU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=geXEryc7; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-30436e8f582so876964eec.3
        for <linux-kbuild@vger.kernel.org>; Thu, 28 May 2026 14:08:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780002536; cv=none;
        d=google.com; s=arc-20240605;
        b=h50oZrGn+rQ2uxk+Rv9p+f/IMYVXudOcGy38NCyoejrhK503z73/KHzVpn9NeWv8Qc
         MMmFIFVsuyk/OEr3FSayyAsiXYmTNWCW64xFpmvmkpjMvpyZE4TS+W2ctVAOVIWKiGps
         psAPItSdmMYwYPV3Y61+Ka8EpnBgLId6CnHUU9JatIwdUGbYB2VCdUSkGpLheyDjB2qo
         I5NgLNzK1FSmA94hMGFJdhAsEjn9k+6NYF1pha0dRv7QSaqBKLf+xZSl2ulR7w2GeHmx
         /swGXnLrReaowtVn/IEbZGGTLprBolRx9fB0L6nyX3KH7IOb8usirn4+DCoCCdCbW/Bj
         46wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XmU7reNrNZ31ByQcehztkuwg8mMdLsojOExD3T3jR6w=;
        fh=+tsFWGEVv8YMOB/f7zu7MYc+OWAoOwgAUCcsroRaFPU=;
        b=DzwBJfauplebEX3mOMj4Xtk+YTSY0bMDC31CTBKLIb3LL7HWswvuWXvllUL05uf2YC
         0eaK5sVATLoesO64v8AVQiGNlR2S7VlmTuOQKu8NxzarLC3kCm3iIDU2GEOjLVoYUW2i
         d/DGvFDDrODKc2GyXniR8bCI1dIGCDbB80LpVJDPgpbFAm0YgDuB++0iGxGhIz5j0thQ
         gsDARCygPa3dPtQwCEc+MVS8uA8w/wqS6rZ9ZUt4g0UDiqDQ6d3jm9Oxu++3bJNNVE0G
         3Y7JvCrkOUiqNCkRaapLUh/tOLeOTL1jIXmdMLvMEn6FiIPmbpKIHpWc2dKTBpW399ef
         tMiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780002536; x=1780607336; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XmU7reNrNZ31ByQcehztkuwg8mMdLsojOExD3T3jR6w=;
        b=geXEryc7sCt5GfQW0cBpuS/2rTcwGhaBHQrgqBAAC/2Mg4lfariOnl8HMBGrcF8fEF
         waYktq9rn5uy7izNY5ZFxDmBlgct0BP7iGNjNitWdPPYN9bkaljfZQgwLRnnUVxFyUSw
         BkIHn9smz/8YityEdhrKc/3m6CU8mzIAqxmkQuuOilGiysFvwPAK0aTfGSHNQGEzZiFW
         muI0UAwbNOxkLkHI6MLXj1G8eSazPdpr33s6OZx5iFK+6pDQHyuzIz3Lxpr2EbQNHPWi
         d+jCaV/1xSk8TGlGMH/0AenqP6AMQzqXhaOUkn7pQfKW6rNuO1rR/Wyz6TBtza/JMDY8
         P2Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780002536; x=1780607336;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XmU7reNrNZ31ByQcehztkuwg8mMdLsojOExD3T3jR6w=;
        b=bj++WHeDuz05Jz4zF18dqF38cGxq9kSAvE90FNjibltVdN+WEBVLDv/XxJubBs8bFy
         571W71Y1ZXLlsJ9k+qGuHD467wxEVhdFqlXQXH8VHf1Kaw2TLonfJZHdDRDST96Ul2R5
         J4dNSLTun5Mi4PuKRSu1Bu2KWoIePVmGzHx4W2Klo+ANJZz64IxzpO/eG8n0zZEtT44V
         BZ1PwFx7VMLbWU4+yMWJVtlQCA7Z5F2StCtagTxl0GAYF+cXmJDLvLY3OJK8HLki2wJv
         Oz4Kvfy4gnmNq4ZAWeDA6JersprLkoHFWuRTyhHkdiyxaOWu6vJo48C+ln8ghx5pvLAa
         bFAg==
X-Forwarded-Encrypted: i=1; AFNElJ9reIvtR2RMHS+MY2+y3CYPOQDPokVkdvKuBdpDn965aYsnJeMatwPqz3HLDkyDDlPLWYeCOaqvdF8k18w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTHZkOPSmnnI/l1k4S8jMkeJJj3NBGQIUKApGH/6Wl7fkhRkEW
	sh8dMY3ocRbR1xJDd/dnH3oFbugj1PCtZlSVxTH6nymlBDYM9p5YQT233ahTCEv5x/r6LDhU0y6
	gW9QBfQZBpHB0fznd+tXXyBdTCn2aFm4=
X-Gm-Gg: Acq92OH2vaxe1mUCRpbQfWgZpySHuk+GY8Mfq4gIteKTLz3dI1tEMKmwtyWPOhComOn
	JySMFU+cAyh/PmbbeRQG2opMeBXC/csRvm8qvc+ld1gh+unGakfvjeSBBucSOSRR/XTYK/MBmVT
	zWLqhepQVuELviDYlaXB3ljBGf8XCfwl/KEYzIugvjLWVu4JMym8T1FFb8rI/2UOFXplthzW8FZ
	6pf3lFweerbtrC/+mZ2LcHQiNIRC3Rw30vgjR1Lv9poZTHr1Hs1LL87mmRDQ96Cav1CLZy84EtL
	hPoxmGpROZxj4S8K0SnxkEq6dsw96jIgiohNYPlviIrzE27xPyYOHguFti5aKvWjypTdPucCsAi
	m5uTX3socvwA/qbRQQYEeQfM1o6uUqhdGKw==
X-Received: by 2002:a05:693c:3112:b0:2f3:3835:2005 with SMTP id
 5a478bee46e88-304eb1336e8mr36148eec.6.1780002536071; Thu, 28 May 2026
 14:08:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260521-rust-gitignore-long-types-txt-v1-1-5be5e6fa427c@pitsidianak.is>
 <CANiq72=cKXdmxEacuGET8fuz_v5eFGB50vnOnKZZJd6iEeAAFA@mail.gmail.com> <20260528203622.GA3100532@ax162>
In-Reply-To: <20260528203622.GA3100532@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 28 May 2026 23:08:41 +0200
X-Gm-Features: AVHnY4ICWiC2kCPKm5nsbjIUemgVJY6nMlhZZQ_wXD2JxRMrC1aT8vgd-7tCGyM
Message-ID: <CANiq72=og=ES5kfO_toU2gbS-YpsrLXH63uC1dRYwCQkdjEWDg@mail.gmail.com>
Subject: Re: [PATCH] .gitignore: ignore rustc long type txt files
To: Nathan Chancellor <nathan@kernel.org>
Cc: Manos Pitsidianakis <manos@pitsidianak.is>, Nicolas Schier <nsc@kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13399-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[pitsidianak.is,kernel.org,vger.kernel.org,garyguo.net,protonmail.com,google.com,umich.edu];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 1069D5FA483
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 28, 2026 at 10:36=E2=80=AFPM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
>
> I view these more like build artifacts since the messages in them are
> really only relevant to a specific build instance, so I would probably
> clean them up with 'clean' over 'mrproper' / 'distclean'. But if they are=
 in
> .gitignore, I don't think it matters too much though, but it does feel
> like they should be cleaned up with at least 'distclean'.

Sounds good, thanks Nathan!

Then let's land this one and we can discuss that on top. I have
created a "good first issue" for that:

  https://github.com/Rust-for-Linux/linux/issues/1236

Cheers,
Miguel

