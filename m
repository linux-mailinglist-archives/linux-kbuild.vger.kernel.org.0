Return-Path: <linux-kbuild+bounces-11800-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHEjDwF4sGnKjgIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11800-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 20:58:57 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C24257471
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 20:58:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A92553041785
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 19:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 933153563F6;
	Tue, 10 Mar 2026 19:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g3djdY+0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F0A3E1CF9
	for <linux-kbuild@vger.kernel.org>; Tue, 10 Mar 2026 19:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773172726; cv=pass; b=VnWDgC0n1gkxwe11HPjivyXnHRmPkRYi3A3KZg+uI18Ro69qqcoKwYCoCpsVfh4ZAX4ByCa+zrd8+ofEs0VD5tU3NRRscTUCUivDAVFLX2A/9QEDdRvJbQfFy+fQcWsdhPXm9NvaesmlvQi6sLdwFv5akl8p3QmymVfSfNLDqoU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773172726; c=relaxed/simple;
	bh=WE2eIdzJ/CezIDdO1ax/5TeyqAUbfRH/raRyKvvD7IE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lnd0gyuU/lZOH8dtumwVuc/55hek87OpL9CB90VBU1OY1Eltnei9jT/Eyy+UK6XB//iJVOWfv4x/kJch/JfdKaCrdfvjAHMoF3SA/ckDtP2ueMk7NtZ6HLwG4P9z2dOyeQNGMTUuvtHKK3QYobE9Mn6fCPD6rauiQvlok5RJq0I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g3djdY+0; arc=pass smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-38a365f1869so646591fa.3
        for <linux-kbuild@vger.kernel.org>; Tue, 10 Mar 2026 12:58:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773172723; cv=none;
        d=google.com; s=arc-20240605;
        b=Up3yy5EZsUDNFhxUQQhJh9Ei2R14C03nLofWUuRGS5CIp1f3vV3etzFk9EDxrNHADO
         D6w1hZCqbkQUX+IBoNKJDKpPfMnB/Xs728JtTlinI/cmNSWPzHChIL4BXgvE7xAZjdgm
         lu13gKlH1Nm6L+SW6Q0WCO/R8EHSklRJs/FuvwJhUd9lnNr630DNByEuTx47TSTjQ+it
         jTveC/MhgXzQ6/lO/2uIDPIBEVtXCFVCVChVdUi3gL4bix7PR0krDxf03glowxaQ+rXz
         uwxmDzvEEhbZ7hTxsBQSTizRk5qHBck8C0KGGc9V78SsyBIzsJw+BKwtYV+CkZn/K5Mq
         Z+mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WE2eIdzJ/CezIDdO1ax/5TeyqAUbfRH/raRyKvvD7IE=;
        fh=fHgGN2PMzDLDNTCM/Bj3iq3K106Qu7/yO+7edmicT3w=;
        b=jLflBVhVoLi5B7jBeEFlV3Q4jVWV+FF3I4Kul4KaBUHS+Df3rKLfncaE42WlLOu9Wa
         Q/TnI7qHIOUdvNnVyHsNMWd6uQ5Lr0PpRRCqv92FNDqjFgGf43q88FJVpT0prV8WTkCR
         iTi8Tb1w8wUZ1asIAs9hVue9emjZsTmCXAENcgJICF1sJoehaBmiIatYtHb1YNTlog9p
         bgObZUI7FX9HdOACLERsr2s5OHZdkvFi9OtSvhKApeWmMJo8ENEGHGU7/Dm37zNXFOnZ
         dJQ47/GJaH/f4q3e1N9I9me6Z0kCOS7/PAzfkN7owdDlvpPx0sP3zG5PpjArBMh6b1zc
         Jetg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773172723; x=1773777523; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WE2eIdzJ/CezIDdO1ax/5TeyqAUbfRH/raRyKvvD7IE=;
        b=g3djdY+0zIQ0RaDDw1x5PbdRoDbssvGfFAikarukNjiubJdFEaEvwHCPUN+Eka8m/L
         tlhb9glwm4qfitEIgOoP5+Q4vzLOr03bUwPX0USIw1hKyHW9Tis9r0I3j9XAS9fQB/JV
         QF9xIKvziGA9JIhRIcGfqs0x2ZjxcUbHqJHBwmXb04/qMk1SK/Czt7YJiF5AM1bARsl2
         k2qppQCs/YR17UR0Lj+xsEc+Avhq2kHGG+gK7KNRlbObqjUKy/uNp5ozCEdOcFkL07Iu
         fTLrSjfhU3AgUt5wGW5673NcYeMNPvO4brN/npUY1gISAcFJ8aCVXSjECrZRiiY2OCSz
         xs2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773172723; x=1773777523;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WE2eIdzJ/CezIDdO1ax/5TeyqAUbfRH/raRyKvvD7IE=;
        b=dtH4NJqTGmhS3Pol3sLlqyPQypb5EQen/aPFlw4ccz75vUqvGUpKy6tCbTU7U9BtCd
         wqA4vM+SIUsuVhJg3UNrkISfvBsOVstAyrTvAzPdxeRXWl+0vKjoDuaUyFLS9a0zNPNO
         KykcoE7Dar6nquyitoxCyJmgKvzOfntvZ7aYAhzPQpkae3p+ukVPwJ5AwIsg33dI8ND/
         8M9tnv7O7tzXKNYpBPYsj5Q1wRizST0vC0bG0822mhADsG757ykz7C7b/9fGWKBGA/H6
         NcIQcj/n7ZMeRlYkzecM46QJJ8YKphX7LLYWl2/52AJ3CoRg+VLrH/f9+rwz9avRdMrA
         d+mA==
X-Forwarded-Encrypted: i=1; AJvYcCXH8pd9pRUwBgiom8QLd+/6auVBk5LpdOalUCK1nRSAGImlLmGiypRrmUWpFNWTLrD8I6OT3UhoeYjH/aU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYNYMJnu9t/i9MASPOPguDnFn7BN19YoCD/keMGsQAvoZt5f/G
	3RKB1svKCmuxX9AL/5MI7eCkS1VoM1QRbbRRZ5kdG0l9wJ9fPCbQ0S1aWn1rSMQVtoSZgow70T5
	lIBfb+vxkp7SKX2BQ+eJXDNVfrQXzspo=
X-Gm-Gg: ATEYQzyMHDCZlZhOR52nDrazHRLkRLnymSw3EQtSuKxMuJ0VaphlV1jp3l3QK/Lx+I8
	o+roUeAdtuFSrmIZ8YQfdgwuNCWEj1VcHK4Ae3A+RyPfVy3j5LhseM01LRDbPQKNHb0rD1L4F0g
	wv/rt/0FrVUEoFNcMpzl5jlA3+SB4vKili83SCZSWm+uh6HtNMWcCZxWMOHe3BS/v5CFj1x5lTu
	iJPwyRZYjdWP9u1etKWNQp/UJCXV2UL6/ij62QPJEPT8eTVtNCG8/1s0szScnqkQ0mFA5roj20t
	wo+g6chwW6qkX0oEaGvWsEFjEgBi8lHlwjLJTarGTpa5/nahCxEme1NPxLps4SHoYMTi7v49K6c
	E91/6MF4ThxhXfvbu2GprHB4=
X-Received: by 2002:a05:651c:2211:b0:38a:2e66:c9f6 with SMTP id
 38308e7fff4ca-38a67e7f4b6mr9991fa.4.1773172723213; Tue, 10 Mar 2026 12:58:43
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310-binder-crate-name-v2-0-0f7c97900d36@google.com>
 <20260310-binder-crate-name-v2-1-0f7c97900d36@google.com> <abAzTFLYsUxK7VJ6@google.com>
 <177315751568.96522.7020199079773666163@1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa>
 <CANiq72nM6ECBE+iiKrBRzCwOyd7BtQ4w6o9AH4+o5rcrcY30kQ@mail.gmail.com> <CAJ-ks9=ijHBzOGxViDzJzGhEBhLg99ryNpN-FRsFN+NLJwVUYg@mail.gmail.com>
In-Reply-To: <CAJ-ks9=ijHBzOGxViDzJzGhEBhLg99ryNpN-FRsFN+NLJwVUYg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Mar 2026 20:58:28 +0100
X-Gm-Features: AaiRm50jqK0rDv9muNCDqsLWESCxUfIO0NWyey9s3iCV9i75UgNNIkOt1tydm6Q
Message-ID: <CANiq72=MfwGU7wpeUdYWhhOd962X8-KU9NyWDFY=wEo2_iPdqA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rust: support overriding crate_name
To: Tamir Duberstein <tamird@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Jesung Yang <y.j3ms.n@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: C6C24257471
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11800-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[google.com,kernel.org,garyguo.net,protonmail.com,umich.edu,gmail.com,linuxfoundation.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 8:39=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> The change to `generate_rust_analyzer.py` is safe to land even without
> the other changes in this series, so it should be possible to take
> that through rust-analyzer-next this cycle and then take the other
> changes in this series after my PR. Do I understand correctly?

Yeah, I think we could do that, but that means justifying the
rust-analyzer change on its own, which currently wouldn't be needed.

Sometimes we do things "for the future" to simplify landing them, but
do we need that here?

Either way, what I would suggest is that the changes take into account
your changes, i.e. to base the patch on top of what you have in the
branch, so that we can review it and so that you are happy with it one
way or the other.

Cheers,
Miguel

