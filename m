Return-Path: <linux-kbuild+bounces-12453-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHk4KdM6zGlyRgYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12453-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 23:21:23 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 181E4371955
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 23:21:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2993C306A3E5
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 21:14:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D5774218BE;
	Tue, 31 Mar 2026 21:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pgpZbKDP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2AC441037
	for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 21:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774991688; cv=pass; b=uKjPQim4F1vIv3hH8FQ9vm3WhdfarsHpH0ckAB4jcPsJKBlu3IpaZfniD+8XNTJJBw3MuV28CxLqcLz+ohTFqz9XoB/ZMh2if0NugwQ31XUFH3zdMPHjxyp+yfPbghe28qntGrQBv39j/6o/0QZO8FNRrpEUmAnME2/Kn+HWbgg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774991688; c=relaxed/simple;
	bh=+JxsCBfymivBX08sGiCuLcobIN7cdPrVFtFlzFTvswg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oxS9glY21c3qfrf4U+gUiZyyuIglHiLS8C4NdBaRHSQ3GcsCRKqWY9hpUNfLuhka3rs2JdvJRPPn2WVqsJv91kWyxScpFwY3Y2TtQJTxGcQzcnbTkNjObxP8r71RBBgTZt6J0Kc1fvpYUibMfdW4zQBANXKna3NPn0kDe6UKlvI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pgpZbKDP; arc=pass smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38a33933e99so4391531fa.0
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 14:14:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774991685; cv=none;
        d=google.com; s=arc-20240605;
        b=EQnrKheBb/oOHclIl0QzeWEYwxkpx8+knc19rfsOerZHHfVkEFgwFgsyscEVCKhrIY
         BqMKpqYMZ4BDOyB2U1IxwA0kkKrZKrc9O9UqQBJqZ0Z0WjTHRLGVTJ2mZtk+s1nN+iqr
         us9dLATpCq8TvisIDKNeosn/6GxjxuJ3lOsAVvIWXPY99+enAOZLhYXQnoDD8hJgpkKq
         kjhhc8TfwrOi3yEjmQpqebwr0qxuh4UBr8ifL3hZontEF93mhiK6aLHhQD0ZHmcea2PD
         2tVbCDIwS//oB4zd72rnVmA8u4+QyDwBhSD3Ec3XB95Zj9eVK9mMb2evjdJg+aYLQn1t
         SzqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+JxsCBfymivBX08sGiCuLcobIN7cdPrVFtFlzFTvswg=;
        fh=JXwfTig2zx4BXsaCVnz1UNQKB3cKUjauuX3YiLPL/4E=;
        b=U8Q8l/NcCC3o0bRDdCZ74FPK/bJwN9x5ET9YkzHsseYxPoVFGy3AFdbShU9qOMin/2
         14lJUCi7sdLDBZtPEPBkDAp9Z1ph2uvX/n5Hl2Ngw/mc/4lVH7jQw2Y16LwAQCLw44Cb
         cOAtn/GQkn6mM24LEtrX1gz7E8uXpnBTPd0BUbl+RcmcG9Gy5PndRjzDDVPg1xr/NYwl
         Zq+nqqw6gKd/nan3xATgpZjULh9VYmrS2Iz3DX819ekWhk68cFYYpy/jRTQXV6s2RriN
         EWaW1qVKIaHBXLk6IR22ek2Tm1nZFIoIimKFofBJuEqQQtQI6afOb6iwrmigeqI6WjCT
         6FCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774991685; x=1775596485; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+JxsCBfymivBX08sGiCuLcobIN7cdPrVFtFlzFTvswg=;
        b=pgpZbKDPX5rw9ZhtnZLPYXW9O1nqFMJtqu7lejQhRDIbHBVvV0da2co4vmSlry6L2U
         J8K/AMGbwV80DKFjqhkL/rYszDWgGcwg3KjjF1CACaPU6qjZPhr/Jy1ceiio8SugpPlq
         /0FgazDqRin9FOJh1VwutKYbFG8BpKcVJUejLGGTIs/htQNMhbpQ4iWbTjY8mCCTSpIh
         LZi/OgOhJoVaO/IzY0bprpXMwM2kfITgLN7BlSVjq6DbIWrDstq7M6/W0Qot2d0hy0uQ
         6OddvKRfxFfDDLKC9Rr2/RMOG/Nszm98C61h7IoJY65AjF6fKxJORf0/+Tjnu1O2gw2J
         6W+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774991685; x=1775596485;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+JxsCBfymivBX08sGiCuLcobIN7cdPrVFtFlzFTvswg=;
        b=Qu2tMMMRJW+k+Q4+LKdkUCjG+3Hxmw1MJFe4Mm7nvPh+w90b2TmdOwKSYXAnNPTBDa
         PfHa6TtfOwXv4SRN8zbRn6djZaGHMJ71AktrsRwK9C4Hl90Ebz8g9zz7U3Kgie7faBVG
         JmYhYvci75wU/TolHqC2q6O0wh51JhGLJc+Uooe5vzgLx0+YGuWJXQvP985zm2uJuK6H
         AUIYboLXYC39bCc6hxWiFIARef/ijpvil9MsbeJAct4jXuLczrc8S6AT+WyD/K3UpSeQ
         6pDL91ewaSgp9FPSl9GdjhcypsmRhlKSu65nMLGEA7HcYyVkI73Z+cuB50AJn/CQszgN
         v6+Q==
X-Forwarded-Encrypted: i=1; AJvYcCV7hwcv6EuZsoK52kwpjIJX0da+arQmSSPLfeeLHmVcAA+FHz/2lshNlK394n3YrSBWCR6sUZ4NtXo2BM0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqL6SzLDUmI99ch5GZGZITPaf2oVeZW+RfNTXJYiuuuHqGXKjr
	/B6Ob+Z0etHGhtPGL2sjSB+7brHMQUXSpZo1R5yaVCYi/hZUQKxlvP+zZg27P748eEd+MPMN9zO
	1U9h4Uai83L8XtU+utPIa3Zx9vbHHhnk=
X-Gm-Gg: ATEYQzwVBLi3Sn4gT5nAiyKG2iujrxOolcirPqHj5yCTRced0zJ8jDphN+kI37yEvOL
	M/YoqF+en9CQ70Us4sTdqHFyrtvDWXlRsIZz1TOQdDOq1ArpSa6CONfHE89Al3QKNCzncPIMbi7
	W6zJbx12mXyYTOIIrWiMg66WLFjvmAFrgt+fl261wFsrgUz2uM7qwpaVeGTr2zGJu0B44tYlWgD
	muJzJyXPx4C4lIr2uDlwi5SxBNvQgDRqTYxOIoNHd3r2HmyPxF/rKNNJwXjHExK16j5Tpm7Ze34
	wr2Lqsc5nTaf3iKGmdxTsfmxHbAOKCWH++rFipAAOQML0HKLYY7HRY1eTeyecbf5+9fq+rnXCFQ
	W1p97a3Kp0S3Iep9povBiz1Q=
X-Received: by 2002:a05:6512:68a:b0:5a1:3921:ab52 with SMTP id
 2adb3069b0e04-5a2c1ee0fccmr147403e87.2.1774991684307; Tue, 31 Mar 2026
 14:14:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331205849.498295-1-ojeda@kernel.org> <DHH9VRFULJST.383BKVSWUTZ3E@garyguo.net>
In-Reply-To: <DHH9VRFULJST.383BKVSWUTZ3E@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 31 Mar 2026 23:14:26 +0200
X-Gm-Features: AQROBzDi8zFnFshWYLfIMPc2xGZV-8btLPSlxaPEnVYkLTlH9_dpustOMhcwwhA
Message-ID: <CANiq72=wsdJf1_qwAADhmKA2i7y9U+3WOm+9utE2rv52_eqnpQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: rust: allow `clippy::uninlined_format_args`
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	Aaron Tomlin <atomlin@atomlin.com>, linux-modules@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12453-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,suse.com,google.com,protonmail.com,umich.edu,vger.kernel.org,atomlin.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[21];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[garyguo.net:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 181E4371955
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 11:07=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> Does it produce a false positive, or it's a false negative? If it's the l=
atter,
> I think we don't need to disable the lint.

If you mean for custom macros, then I think it is just that it doesn't
take those into account at all. So I guess you could say false
negative if you consider that it should.

In any case, originally I just cleaned it, because it wasn't a big
deal either way, but then I thought it would be best to keep the
behavior the same. So either we disable or enable everywhere.

Cheers,
Miguel

