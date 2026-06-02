Return-Path: <linux-kbuild+bounces-13466-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFqpKw6JHmr0kgkAu9opvQ
	(envelope-from <linux-kbuild+bounces-13466-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 09:41:02 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D328629D10
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 09:41:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 01297301BEC7
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Jun 2026 07:38:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1B363AEF4C;
	Tue,  2 Jun 2026 07:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PrVkap4I"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE2631DDBF
	for <linux-kbuild@vger.kernel.org>; Tue,  2 Jun 2026 07:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780385812; cv=pass; b=mEV0+UQlqrlN4vB2b6igveDVrc3lOgks0dlsF1rxz6m+ywW3SnRH9wrppBdzHziCumN2l/2bmnWCZYYpenMly3y0VmquLVZYkIkfQdLQfxETfOI4bN5FdGQNuG2ZrRpTwOQHmUDrPZRzoVYqwQAiQgGPBpqlBNFDfM2C/hd6ER8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780385812; c=relaxed/simple;
	bh=+A/GV5o2sUlHF+5jSvNVL6GHuIN8ETVy4HVJ/HHAPUA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iZgo5VVUjY1uimoUCHVvJoDcjavfAsVRW0cRpL4AyhYta+LhgxG94CGGSvhySYFSNHjZVy2bZwpJ62Znoeq4VMsRnLVb3cgqQFWlAEjRlRjV4hKvNBiWMYcHN88xi7xwV5crzRm1MEjcCj6OP+mZY9SaCHp62M519EKor35I6B8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PrVkap4I; arc=pass smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-137eb8e3491so91859c88.3
        for <linux-kbuild@vger.kernel.org>; Tue, 02 Jun 2026 00:36:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780385808; cv=none;
        d=google.com; s=arc-20240605;
        b=Z8NfKt4aK16JIZ+ruRh1pcWDKxNOdBnchP9sDfhh1nlmsP4BkRUdrl8AhXjaD/dFwJ
         wFtpBStbv9//63hxC32eWIeSkfamhbx04L8SlBCgN2ywVXmZz9jDmePJWBPdxtewi6ef
         2MRDDaVGKoIZpTCij7fFmpNzrkn9OWaYYlNURY+E1DC3WPeXG2oyUThI+2Z7OwhfNrgp
         VsIYYObs7jaC5Eynj0OEQOuEI6zQH5l4eiq1N7sABcMFEO8dhkNKfoB7YgE3qyCxHD2Q
         wc5Ep8I97Ty+wjY0WX5vbfqFWSFEsg8zmcmpSkKfCBmepqRaRq39vyRAEia6aBhqwM9q
         aXXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+A/GV5o2sUlHF+5jSvNVL6GHuIN8ETVy4HVJ/HHAPUA=;
        fh=rlsccMMkOlOIgkCmbEQNz7AnLaTnNWsp2mRCwqzAavI=;
        b=JMGNhPndg7mFicPVHrgc8TDIw6itTgpjBMYHue/frR4hl7az11n3YIUYkjgOodCidM
         Bh2NZSo3UOdXLqsz5FtVOe5fJecwyeQRxJfWa/nTLG+pVVtIBQzOChdjWv6H5EeL0o8t
         N0cc3xiFYKURbXGVmCg30P4dINcSmqdB/0xy+uewk7KS+y9e5YDkPYCRwaNj2vMEuqLJ
         DpjJCZ/NsZCXrli0PQp/nVzd926TMvE8dudO+a7EAXGyncta2FpZPWugEIOXcHaB8UUW
         RQgwHsn7eu6ROC0ZT3NedwUj7+JhDzzo6PARuMIzL6LE+mWvSlm9RhUnzwDfNY/e2zWE
         Y9SA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780385808; x=1780990608; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+A/GV5o2sUlHF+5jSvNVL6GHuIN8ETVy4HVJ/HHAPUA=;
        b=PrVkap4I57y8fhb6AwoV4w6aKSd2xz8XwYil/5/WNN3F+u4NhsSRflSPIsRbpFib/D
         IFg8YylzjPYqQuijTKVND0mrezqwA3JQjhbkVhcGKd9qscnlg4rWy6NTvyTZAU7o+/LT
         XbR4G5Kf3KHzEjvYeZJLo1z9kDCKPWniR1+YNtaSIeV6kUOVJT9WsOoLq7rhdTJcheOU
         Jz8oJ1LlPP2DM+69ZDug2FuQckFal6aJiSTUU8psUWn8i6ABdK6QqX560a3xtufV7sl8
         9Aiaw7HvKrtwQV3y7aRuN3FsmUFwt/IygnPD6xaTpgIRYkbCtk2SAOzVMKGCBflTyr/7
         WyXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780385808; x=1780990608;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+A/GV5o2sUlHF+5jSvNVL6GHuIN8ETVy4HVJ/HHAPUA=;
        b=SKp89tl+AGEVA8JmDTblVP9s90vawgtFtcs5OQmcYtuwwM4gTIkoanZelv2rk4LiQj
         NXHTikWCRvWgZLbjaSzO4KFRVpEw1bK2j/+0weZUz1fQzKuhqhG07EYdwl58lgQ8E7o8
         +1Dm0mbnFeFktAj3S6664G6a2q0PIOUPO7BNcu0KHBCBEmOwqPrUd73ZHb/HpcSNGIaa
         dRIhlrmbnZ3i9IJQMoE5cll/soKOnF5vRM4Ds8pmV6jorM7GRtqT71BUk4pCWFk9r22p
         uMN8P2Y8gjSpWyVXgyr4oY5P48Hpc2JOXC6zw9Ecwfhj5X0Pr9Ansgpvs/vlyz2Cl8BF
         3xTw==
X-Forwarded-Encrypted: i=1; AFNElJ91z8Wp1wNe/r6Ym7/3Z4luJztvw1n5KMJQyHX3bsPsv2MvyOEKIGY3dgeNGshilTQzMVO7orhA8oCJ6sE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaSq3onjAxK1Q3k0Vubs8hYXpJBMjLkQXf7/0S8hZFuoc2gW35
	Zr0uUSMZadMDk5CtTh5vM/7fcxiHM9ZHfNxtKB+S1BBboUsA8eBhMwTUR8hZTimroH7YxTAIpE4
	3mUZNCo4exHvjdafKy/Fjrchd74BXkqY=
X-Gm-Gg: Acq92OELNmIRJ39ExgU0u50JHrJuPMieX3znQ6ktLP9IzY6A7TXp7fgnY5nhNPsK5A7
	JZAE8B0UYw27DVd7kAnQ6HMmQbzfZN6wuVwoVEMLww/qnItxAMS+Ujtik1+kVFeCs1z5LEwWdCF
	k9DcDpkt+XDob4cPQKkeyjsLneKMIszIZgBbqPW3ewNI4Pzj0mUftR1DaoRQw10CBETBG7LI0lo
	3DtIHVBsXGTRJsPbny4qovXUj+wSbOZxi8nL92Zm6r/0sZfR6PUBgzroVnLwr7MHJ6Qoxc5afOP
	Ncq80ps7Ok5WVzlNm1CDuYEwFs7uxeh3fgtikTaei5LTkbgoyObOy98TroCZnBEAMCkduppLp7Y
	kPRTdyd7JSD2eGz19cYFn1IX8sl5LZsu53g==
X-Received: by 2002:a05:7300:fd02:b0:304:c73b:79ea with SMTP id
 5a478bee46e88-304fa65935fmr3407438eec.3.1780385807836; Tue, 02 Jun 2026
 00:36:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260530184944.10459-1-contact@jkam.dev> <20260601165042.8450-1-contact@jkam.dev>
 <20260601192305.GA965997@ax162>
In-Reply-To: <20260601192305.GA965997@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 2 Jun 2026 09:36:34 +0200
X-Gm-Features: AVHnY4JJ4SVDYenG-jUsNBsnkOBJxlBK42SYK7J_hB85geQn0FH46b8_Yiq3DeU
Message-ID: <CANiq72nwsocH1xypqFegtAuopaARid_3NHCdbZNhDWjYOtNe5g@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: rust: make `*.long-type-*.txt` a target for cleanup
To: Nathan Chancellor <nathan@kernel.org>
Cc: Joel Kamminga <contact@jkam.dev>, a.hindborg@kernel.org, aliceryhl@google.com, 
	bjorn3_gh@protonmail.com, boqun@kernel.org, dakr@kernel.org, gary@garyguo.net, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, lossin@kernel.org, 
	nsc@kernel.org, ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13466-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[jkam.dev,kernel.org,google.com,protonmail.com,garyguo.net,vger.kernel.org,umich.edu];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 5D328629D10
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Jun 1, 2026 at 9:23=E2=80=AFPM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> Not that I think it is worth resending over but I personally find the
> "clean '...' files" title easier to understand than the "make '...' a
> target for cleanup".

Agreed, I can take it and use that title (with the `kbuild: rust:`
prefix mentioned in v2).

Thanks for the tag!

Cheers,
Miguel

