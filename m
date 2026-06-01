Return-Path: <linux-kbuild+bounces-13442-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBmyIfMTHWpNVgkAu9opvQ
	(envelope-from <linux-kbuild+bounces-13442-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 01 Jun 2026 07:09:07 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C93A361993C
	for <lists+linux-kbuild@lfdr.de>; Mon, 01 Jun 2026 07:09:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C40B33011C73
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Jun 2026 05:09:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54AED330315;
	Mon,  1 Jun 2026 05:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f+/uLBX5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021A723BD06
	for <linux-kbuild@vger.kernel.org>; Mon,  1 Jun 2026 05:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780290540; cv=pass; b=K/gyj5IHkwI3I2E7ulVtGeD3hSXm+4jMD1FsCcoj2k0vLYcFOvhvQiTZJJvThpxGxKqxon04vlIRrQ3Lq0Cl6RtLQ5woGJiD+ve+oqdT+EN1H6SuIwOFr0BucjyXVRM81dblDiBcQ0i0hpQVs4zi0FdwnWQIyNDfRjMhf2XN32Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780290540; c=relaxed/simple;
	bh=DLHofR+qVlmv7Ort/L1Vx7+iDrPzzqDrje4JSlzLPMI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p6lNgX96g6v4PqwKdvpCjRw/8gayc12kfpsj4BGXiLDASjqb+zHQ/DKC+OIdzE51gQeEVMeSkX5ZzOU1IwbFbdbSslHg2ZvY5vUsPjei287PSfLkxynqENPUvXSrdsqTmFK+KPqrDif1Q9JmUclaXdzsc6lBnb3Lff8kH0Vesxo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f+/uLBX5; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-304cf9a02f9so397407eec.1
        for <linux-kbuild@vger.kernel.org>; Sun, 31 May 2026 22:08:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780290538; cv=none;
        d=google.com; s=arc-20240605;
        b=DRGa6QVbIJXUPbZhDlVCqOJvZinxh+N5W5vbMbXlGZxa6IkqerABGjSbhI0vdp+GKN
         h+UholvSKTD8mKphjKwn5BzChwpPtKdR2qtglOyv+6rPfISrsRG67rsXu3LCwNZdv27V
         s+BgiG/+tgfCKXVp3pufxqsoqhteLwOKlvftkii0R4XzasH+UzajuejPy67flqi/rb7j
         etkBUYj2Xsg/G1OKQ4bli20pgZM1ne4BbOCepXaRHMkMO24Knn1ss1QqHcc2U/FSosBu
         U8/dOkOmQOXkSKM6KzYItL4A9nb46uvhPEmGxnyfHCp3etnnvwsErly9SMT+T/1dzTcM
         iGdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DLHofR+qVlmv7Ort/L1Vx7+iDrPzzqDrje4JSlzLPMI=;
        fh=JbIWiWD8e3ZSMNOXO1aCiELSNBFPPXWc7nbmo16M5s8=;
        b=HV1QU+kWT+iXFyjjv2jeTgV3fU5e9sDaJwl71erRU9O33AlE1oFdtmYw1oTlJK/t4/
         KvWwtrZcIMCbHsAHv1e0zRS5ABjxbdUaBrz51Y2DBLpMr9zbCmCRzp+wvuAHyeTEZR7c
         ca5KLpgLWiNobmumJAieyIVOFH6XHueu6vPSIAB9zG4Hjq9jUjDRA0s5R87va9ebE9fT
         2y9hlkfzoJLJjyeauGHHFlyCrUkuHe/Sf2JYSLrLEy7ayDu/2dRZLC5nSXcLs8o9kP4a
         T/s5Q5NVb6UsM19aP5juYOuBueacjl1PhvJm3nTFGz86Db/20dXZroDCsvTTJt4fFP4J
         /hqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780290538; x=1780895338; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DLHofR+qVlmv7Ort/L1Vx7+iDrPzzqDrje4JSlzLPMI=;
        b=f+/uLBX5KXQPa+0TxOXIgvzgLwS8Ek0Ao2dCm+nPv+JySVybyYGYssquL9jkAzDbfz
         GJ64IEO0sOVIcmoavj+skupSCTmCMU48t/T5OxCEoJ1rugRUp0f7nvEOFB6vSg0zBQUw
         QlGSrG2ZcGzm8IjlVTfNjgUPAjRVlrLw+XIq182wO+bIzfVZ19vN5NoCdWfB9QvTaqSZ
         NhdTQvZBiL9NyFW0MinKOb538ia4ACaTcLMwX6v01EheMqzATcsRKBupESLRzeHGNAFG
         DvMovTppR6GPP2iL8E398+Tmv0AQ2quK0eIhugNXbaLhS7HtkyjRbWIXBYz4FbAxgVza
         Ks6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780290538; x=1780895338;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DLHofR+qVlmv7Ort/L1Vx7+iDrPzzqDrje4JSlzLPMI=;
        b=sV5bx/HEQ4LojSKgoE1O6HS127BbjWJh49ZlfuhjNsDGCcYJqggo5CeY9Zxm2vrvRj
         STsCKmWHe0BkGC4mjp6yZppEXcOr9+lJ4lUj9OpQGP0/dCm1JFqWnOAbLL+lTj81kXkv
         81qSWGf1xi+okDAY4GnCDoqXtjilyIhxiul5kmonqlsfc+eN8DkRbimCJXBR7F2Pf0AQ
         vDNI3fBo+QboEmX7HrdpWNkqjse/UhQiIxk8XLrj1k2BjdDwFBWOeGemHdZwTpW/b5T2
         aQMR+k4HwppVjTFpWoKira/N/PlhvPLAJk76vyHs+g49DQLi/WfuzxMmZSqkjpFhIDQV
         GmLA==
X-Forwarded-Encrypted: i=1; AFNElJ8P6IMqPbe/te8uRdII/1IhwCqdDuSZdJ01w8M/jakWkpXA5e5M8TPyr0g68XbJHb9rGryPIOYSWKXnW8c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrWyVrrmUQnfC3QryIeY0WRBhkrowOtmCC8+WUA95W3AGj8iei
	UTccflvw3onKm1+i77M41JloCGGAWajeDHCFzo/HfboDK6CoO26GHmMoknYtFFe8hQVMFi+mG3B
	ydxq2r5nsKQqoELWr4CuXGWqtngDGBuQ=
X-Gm-Gg: Acq92OEAT1/L3W85cl6TQpoyeJ6FFwa5AJzj51Fh9ulbSkru1EBmQ97J3e0yQi/S+qg
	QTnMJY1CUYjdMEWqHJNkYlV2y9sVe/WBvksNwWFcxCXYlPnkV9F5GNi25m2qZAQK8t0yLoeP0tn
	HngEOGftpXRKOIwRbMFe4AaX56vceaK6WQOKMDiWFk3CBrmqqwvzfOjY3JIUV5KTCxNZCH+h7m5
	aum3uwtGNynA9eq+QvWQYFdY/miJSDbQt2DY3GM09rxjG+5UehrT/EEIJ2RxrICQKCIPuLumJdW
	cpeFtQu0geF0tg7jBuQPc2VhdJyjctcBuZc5GuRH028OtUlK3yPx2sfQbmM3d7eOfhyVWr8rcuz
	FMdNirxPVVvsI7y9uEq0Vg908pz3sGYM5sPq3FL5Pn+eh
X-Received: by 2002:a05:7301:6785:b0:304:c73b:79fd with SMTP id
 5a478bee46e88-304fa68f723mr2267873eec.5.1780290537929; Sun, 31 May 2026
 22:08:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiq72=huc=AfjBRYUsoJY1hSvB8W6CvnUh7g2G4rt98XYmxYw@mail.gmail.com>
 <20260601042304.73316-1-contact@jkam.dev>
In-Reply-To: <20260601042304.73316-1-contact@jkam.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 1 Jun 2026 07:08:42 +0200
X-Gm-Features: AVHnY4KsJdAwzSzsNpk9DG5c5vtCbfORDzKMj1SGXLhQYJA3jZph2tiTT1IJCmI
Message-ID: <CANiq72meRS8rhk_DgHGrmphLBTdch4wFwZQS7jcx6uM9a1YvKA@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: rust: make `*.long-type-*.txt` a target for cleanup
To: Joel Kamminga <contact@jkam.dev>
Cc: a.hindborg@kernel.org, aliceryhl@google.com, bjorn3_gh@protonmail.com, 
	boqun@kernel.org, dakr@kernel.org, gary@garyguo.net, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, lossin@kernel.org, 
	nathan@kernel.org, nsc@kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13442-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,google.com,protonmail.com,garyguo.net,vger.kernel.org,umich.edu];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: C93A361993C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Jun 1, 2026 at 6:23=E2=80=AFAM Joel Kamminga <contact@jkam.dev> wro=
te:
>
> Thanks for the comments and tips. Just for future reference for myself,
> in regards to applying changes strictly to the metadata of the patch
> (i.e. adding a changelog but leaving the actual code unchanged), is it
> preferred to just resend the same version of the patch with the
> changelog added instead of creating a whole new version? That was the
> impression I got reading through some earlier patches, but seeing as
> I've been creating new patch versions and haven't been told to do
> otherwise, I figured I'd double check.

Good question!

If you forgot something small in the patch, especially if it is
something like a typo or a missed changelog or similar, it is usually
simpler to just reply to your patch and mention/quote the place to be
fixed.

That avoids a whole new version for very small changes, while making
everyone aware of the correction. So if a maintainer applies the patch
earlier than the next version is sent, they can fix it on the fly.

Now, of course, sending a new version can make life simpler for
maintainers, because they can just apply the new version without
having to manually handle those bits (which can introduce mistakes on
their own). This applies to things that end up in the commit, so it
doesn't matter for e.g. the changelog.

However, sending too many versions also has overhead for everyone (the
emails on their own, the tracking of each version, possible parallel
discussions in different versions, possible feedback on the previous
version...), which is why it is all a balance, and it is usually
recommended to wait about a week or two before resends.

I hope that helps!

Cheers,
Miguel

