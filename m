Return-Path: <linux-kbuild+bounces-12241-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OIsrOURBw2kFpgQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12241-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Mar 2026 02:58:28 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6490231E877
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Mar 2026 02:58:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2E4D23079A65
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Mar 2026 01:58:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 623A2277029;
	Wed, 25 Mar 2026 01:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ywixa/ez"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026E127702D
	for <linux-kbuild@vger.kernel.org>; Wed, 25 Mar 2026 01:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774403903; cv=pass; b=tziHfmzA40VmSOZrv7BMEoDGli3P3S7xv9JIfrCdt21itCWJFAq7i5AheJrn+U1s2P3NqtapXxyzx0cXvepkdZtnzPiibm649MxXx8xWlgWwZyOkN2ifMZb7a9CvgvOm5bqPTcKOcsR9XRPsPefzxvH71a5ppL5xfQpfIeUlBBs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774403903; c=relaxed/simple;
	bh=uATiCdJVNXsXbqp7wQweEzFd+VzHCHpWD2sO0E9ZBl0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rp219wbbfM75yZGJ5SUKH+HycZqwb+2eeWhf8hg8g0ldomxITMEgcLS8VBvSBeiBjAUrFX4eWnp0vQzY1+v2oi/7Z0VQtbc3lrjVQUZiAkfwi6OotLApuNRaBMDnBWp88Q4CCmfh++knNZRZ2+8a6RsSIvMKRLsjRkIvPEWqkEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ywixa/ez; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2c0bf0a0236so211827eec.1
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Mar 2026 18:58:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774403901; cv=none;
        d=google.com; s=arc-20240605;
        b=Vi5JDa1MIXxYnY9lR2qBtR//a9My207WO6D8x7APA/w7pbPhxHnkT35bpXT5xOuNzj
         fD36PDCed6L6ucbAE7KFEd0V8zIpHTCLYptn6XDR6f01dSKUcLTUiHhqaG9dVEgqCf3Y
         65kuCcmXvXg2YmyjnA7DVApkNOsPZ0pMShvpNAhUrgFiqe6JmdmEg9aewFM9mvETO6Ox
         Do/0aqL8lvCFybGx/TiiQYh4+d+oV+HIxQqC3kTkDLGlO1RmhJ1XKJka/o/wN8WIUbLi
         +BtpgymjRfbigng4joAqhNrTafirvznXP1oXAdciLlVUjEeIUOF4YsM7ywwy72q+aM8y
         /1NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uATiCdJVNXsXbqp7wQweEzFd+VzHCHpWD2sO0E9ZBl0=;
        fh=Fchcp4cXrJp7cVgMy02OsyPsnWtHhRTw0ajM8deuQBY=;
        b=WHzP2VPw5YLq8Q5DJmBCOXINFw8TgiGTmaRNNoeP5HcUV7Yo8jb1VH+L525KewL1r9
         h21RRkjw4FjEMH1eYGKmh2XsI6vhiYvFjjp8okEdrJjtke2RPMm7ncqDzE1zgVKmcGdm
         +i8fAYixOhGO4OChS2Z0f7xl/ydPu0UAOBD6yFM3KZB4ijkJWtKZEf+RtRcP8G47cXCL
         BMffCZHsJ9/vi0ieXrGjcLuPU/MFoHuEESuLDeB1th1iqVbigiU2Hl7m3o5gVDOnj5Mo
         i/VZNOGatVOk4YsI0eJttX6jISEYwmbaYQHD95O5fVj2fCXFJvDKfy2XGUjKPW0Lmt86
         nwdA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774403901; x=1775008701; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uATiCdJVNXsXbqp7wQweEzFd+VzHCHpWD2sO0E9ZBl0=;
        b=Ywixa/ez1uiDZdc08Qus0DA53ujwgs7OIdFh4HueA3lpFSDX7gaODCqomtBcJmBXDR
         a+zldmEgicVBYFXqUmQadDqW82u36tDQDQeIOIDUVBHpx8YCqANM6F8xVcxrAYTFk63R
         GFBaj04os96MEQ9VmDA5NMnlazbyn/F96rUMa9cqllJZ5UvRXeTx+OybhHBRqstuYnUn
         9LjGaYUOvxo1lktmGecxGZZqOfhOEqY0Q8BnldZp4qJBo3uywfxai48L/SDjk3BFK1IO
         Z6JD24U3liroe3nP+EwE4DRtc26KOPmTEOUKa4CMlQBEIqw7aVqcy+9mX4j5phJkZAfF
         MRsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774403901; x=1775008701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uATiCdJVNXsXbqp7wQweEzFd+VzHCHpWD2sO0E9ZBl0=;
        b=nGWn/Crm0k3+Mt02yZJdZu/imNw9A9tJeL4olejxWcyCZ/kAiugPXME2doD902KsG/
         UVVgnxTcCmSWtQ238YWVeyFiSeELHqK9NtKz7+s25f+ummhFr8dxclQeoVJNx1DvU5sO
         Ib6KdhmTDnTMz4M8rpPHaIRdr5Sj+OqmBM65xUmvLncbcGuoXX0dIUwd/Y+JDPtRIEp3
         cCZL7LhOYd/tFJXcLX4/i+jTFmuDC39XJbxwXBDPE8NWNBpYuuJ8BUqWGZ29WCV00ykm
         3dWxpRyPxM2XUuZp1PS1hZCF4QjLf5XjDQlo57Cd67pprQYFF10jM3HfXH1IHrLXQNVt
         J/Xw==
X-Forwarded-Encrypted: i=1; AJvYcCXUW7pBh9szJ2HPDLCrcLZQzILW9gAY2HYyj9M3Jg+bXhVuiUf9heYTaXXeqVICBxvjw37uP8C1w4inBbI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6MMj+abx0dBYBGcLjxjYyuxmnIXu8kth2FnQeNFrXYes1OhMY
	QhFWphGIB0qWQ9mziIdNBr5UIAzh5QsxYxAABgrFly90S99h69cFiSOAAwFaexrX76p62eQWRgQ
	TTUZfqQJfbNyBVFZ59AIJDRiST+3nHmE=
X-Gm-Gg: ATEYQzzSvzz7/7MZtg6inUqfWYuK26JlbJCKkDpb4uvFAtRADBBYx8+kwaJ/aZqvTDc
	Ia01uRd7QL/A3DDSnMo43Z9IWYbH/HzvcjrVaRg0moz3rztCF4/VQhfoCWBU5e0jmGByEmLQAuN
	pYcumu9vh/rr08ApzetQEV6SxhKchkb3VidJbrJpU7pjPkRQ9SnjQ8F9Q0Y//cl6oSfvbzDAbP8
	4Hh8c11Rq6z/xFBLxmUgWSbNgAjFWkU46imQY8XRLwd0SUuSP0nraCiIVhMWqgQ9LFQOEVc1+Xu
	X3F+tddDpKy6CMWB2k2VUQDfu1I5vbtmsMFWcnw1dOQnesMS7ky1G4FH1P33UKKOeseGPKQCfVV
	E8G0YqQpy2/Tn6rI4oyPWYqQ=
X-Received: by 2002:a05:7300:dc10:b0:2be:298c:a11 with SMTP id
 5a478bee46e88-2c15d3a8a70mr394983eec.3.1774403900918; Tue, 24 Mar 2026
 18:58:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260322192159.88138-1-ojeda@kernel.org> <CGME20260322194701eucas1p1f72625f53e50806fa4f430550f291e76@eucas1p1.samsung.com>
 <20260322194616.89847-1-ojeda@kernel.org> <1c4e429b-f30c-42a9-8de1-71cb2cbbc114@samsung.com>
In-Reply-To: <1c4e429b-f30c-42a9-8de1-71cb2cbbc114@samsung.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 25 Mar 2026 02:58:08 +0100
X-Gm-Features: AQROBzAYV4sPQIbCVLLNfW-UqAw-p0H5kvr5leqfcWwqgBKVIhpQi6sU039YVRU
Message-ID: <CANiq72=UPiXc7JLracLeC6k45ToByJWZedp3B3j5=5mAnyKZmA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Danilo Krummrich <dakr@kernel.org>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Christoph Hellwig <hch@lst.de>, iommu@lists.linux.dev, driver-core@lists.linux.dev, 
	acourbot@nvidia.com, akpm@linux-foundation.org, aliceryhl@google.com, 
	anton.ivanov@cambridgegreys.com, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, david@davidgow.net, gary@garyguo.net, 
	johannes@sipsolutions.net, justinstitt@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-um@lists.infradead.org, linux@armlinux.org.uk, llvm@lists.linux.dev, 
	lossin@kernel.org, mark.rutland@arm.com, mmaurer@google.com, morbo@google.com, 
	nathan@kernel.org, nick.desaulniers+lkml@gmail.com, nicolas.schier@linux.dev, 
	nsc@kernel.org, peterz@infradead.org, richard@nod.at, 
	rust-for-linux@vger.kernel.org, tmgross@umich.edu, urezki@gmail.com, 
	will@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12241-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[41];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,gmail.com,collabora.com,lst.de,lists.linux.dev,nvidia.com,linux-foundation.org,google.com,cambridgegreys.com,protonmail.com,davidgow.net,garyguo.net,sipsolutions.net,lists.infradead.org,vger.kernel.org,kvack.org,armlinux.org.uk,linux.dev,infradead.org,nod.at,umich.edu];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,samsung.com:email]
X-Rspamd-Queue-Id: 6490231E877
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 9:49=E2=80=AFAM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Yes please, this looks like an oversight.

https://lore.kernel.org/rust-for-linux/20260325015548.70912-1-ojeda@kernel.=
org/

I hope that helps!

Cheers,
Miguel

