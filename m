Return-Path: <linux-kbuild+bounces-11794-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4OsNA6lssGmNjAIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11794-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 20:10:33 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CCF256E04
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 20:10:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BFAC93021966
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 19:10:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BC3C3CF05F;
	Tue, 10 Mar 2026 19:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WX/PnElr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160953CC9F7
	for <linux-kbuild@vger.kernel.org>; Tue, 10 Mar 2026 19:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773169829; cv=pass; b=h4E3le5d9F5fugwxCpCw/LfZd4AoitGtiOz37ZIWRlvFLU6L3QIB09OeqUMeNkzjsHO2Wh+IIGtNb1gLlN30K3b5A0OLElY0t7WmkEAfoDfIYXdHR9holzoEY51HN/k4CmSMbXh1a8Cn82xTqyZgfFFeLiDuqBSjygnMh9GSCr0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773169829; c=relaxed/simple;
	bh=u4SOSYSRkobcgI6tnG1cxDItxRlmdsL0sG4nwFACfS4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LPoSwCMELjc+9HauFrBnDi08wSRqQozZk8Kc5+M5f1m3K2Gdu+EcaS4ArKMQFC3Cy9cWw43kp2UmBTKoD5Co9WkNsBANFcpmUfJQm3xkBmy2YaJnOHtGhXx6NXxKYCZj6ElVwiuo8o1xP7fOal/12Y7gLXGa9G77ZAnDSYjvDkg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WX/PnElr; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2be851b8ef1so53261eec.3
        for <linux-kbuild@vger.kernel.org>; Tue, 10 Mar 2026 12:10:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773169827; cv=none;
        d=google.com; s=arc-20240605;
        b=DsIFCQa5qoa/QW23uXwpWmeMnrME3vAttzCdO4ZUkGmP1f2q4I+wuOYLjYHeJJQZ5I
         NDMeAR1HkJossiD3YMEbF3E2VcjEL9QKS4Q5Qc4KFtijZMl2Nzknj1g+Se2SLxnrJvgj
         HXtExO8Tn8uTWE4JtaLjh5os5FC9XyVgHbgQ5NHyhQWwX+Fguek3YWFVvr06SNGCnUe8
         evIELOoJDJZQPe1jpyj2Q7Odb2vW7nwiFr055pMYSoFEi9fqVgSmezVGaLhDHJfN0IIE
         eIWWeg6Pp4xN/dN5wNDv25shxINl3K16yPsR/qBZc5Zn3rx2zH9zxJegUbEhtw/oPniU
         UYRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EhfooXBJB3ZFaCtfLacaIpGHe5+WFgW3wuVVYUoToLw=;
        fh=hQoJRjX+NXP7PuDBdlPMiAm5pTK9IpBxZ0CwiSeTUgM=;
        b=a84ScJrsRVwB/K0Z2gccVsML5JZWBFKrkBSUyVsa7MncJdXaawy8aa0U+Hhqf2cgXF
         28uX82bsdVbGQa+ws8j+8SLJ13piabh2I+tOAcQE24eo1pIRxvLjBuABj+xLbEKMezOS
         ULE0BGfTWIJAIG7S0a/425pmYYIONVELDOqf/4uSy0NN0k/aFjmMnMHn4RDaRvPiiITn
         Y6OHAkrg8Hi9cLZcQfOyKrvzedeDEH6mJmzure7/tX1Sd2Nq/3EPg/UUN0wSaoI50aUc
         62CsuyNh5MnWLbLGp/c8mKl0wpEg9LVu+JJTUsZXcLWxQc3sXAgzdTGU6eKuUm/WtZ4a
         gS0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773169827; x=1773774627; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EhfooXBJB3ZFaCtfLacaIpGHe5+WFgW3wuVVYUoToLw=;
        b=WX/PnElrkE3uVgtJCYmWPcd1YC8KiXypsh+AoeGRCRYLuNP9NzLr3SOLxowFsLUFsx
         SepnjnWkXmzKI2oX586thW6YZkJZsU/bW2ekP292MrcSsrFwfOKP4Tgdxm29I2omPc5+
         c0BOK61g/xxEGZF12fYNHcawXggbvZ8fpG2ljrByHnQABBO+NQ9yP3Tpxyiacm2Cj13r
         nSNeI28dquKNX2M/IIWWRWweFrmbMLwZdWA5p8tnGiBh0QNieIEhvBiYME7Fosfn1shw
         MLnUz9nxRkD3kfM1z32NiDQdlF7zo0MZwwexa5iqqUNU/b3YwtNQRP6+vaD9V8/dKLJK
         84Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773169827; x=1773774627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EhfooXBJB3ZFaCtfLacaIpGHe5+WFgW3wuVVYUoToLw=;
        b=k/UpJ+NsbN52Ei0zQj4kO3jHQUSZxrazyh3KOLHkP7QgZSH/JTKo2Bx8L5kkhlqCr3
         g6EWm++sUQPhwnMS3GX+sBN11/mcDL50zme1kBvTIBh0/24ENgnH3zEEcV7fxbn8C6iS
         Qvi4DKLFAUhlHbk6fLYZ4KBjpucIzB7ZM7zUTaLz03BT/jfpZSPGQh1l+kHArKq+iNgd
         cH1h3f+93yDQVi1ilpHk3X4Q9UHmfe5uP7KVDXz8BQ+tRnZAC6HyzrcBScST6iqTxs3s
         oI0rh9oypnmR/7Pj68orkvmtQAVC9oNhKDsGXNFjkeRAeSdzhpIyM7QfKkcXWopl0Qqz
         EG/A==
X-Forwarded-Encrypted: i=1; AJvYcCUnHg0/1kEEIalh4GyzbpBiDxFvqW1ZML9dvaN/Wdj77d/UT6ZwA23OoG1aKaSPzNRFLN0+CBoRbHNYg5E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMJivTN5ZtMK8IJk29536P/8EAIkW+XSHeJx2LJTG6LRel94dP
	lU8cSD1938M+3g7KOKs/n2CUtzwN+m3sd6yrplKTA8c8Ca1Nv0i007fWu9hqf03lckIHK1vtn2y
	RKjhjJPZjpl2wLohc/xGCnAvo+G9/khM=
X-Gm-Gg: ATEYQzwTNInd6RfgYDFKwlOSe4+pXnvV4VKbYH86GW6B+d1BslEYGcGOhIKu3BkUn2W
	n4nCSdqBcXfMvehpdww5JH67TV1AV0TJUovW6mtdeT69RbNBTWHThlWhfKn41uZ9lJjoH9SnwLH
	oTWxyPLVHPS84fW2M/VHwVXG5ftxL+kkWHbKq/CwJhkerax+Xi2W/Vo8Noosk0i+qWpEvk3f3KN
	Qbl8DRz7ZFw3KFH8PVNjEwR3yEm6JAas1KeCR9clyG223ECdzxk3dAw3yZQHdBS065M9t7rvStE
	hcdvbdOiLU7u4EFkSbwIoa1zmDv/63ujahgU0rat3wmn4SBbb4G9ACokRZTkusKau7XmMdcaAw2
	5k4ktWWSdfcumVAjsvEoJM/U=
X-Received: by 2002:a05:7300:d51b:b0:2be:2b8a:9523 with SMTP id
 5a478bee46e88-2be4dd701camr3074855eec.0.1773169827177; Tue, 10 Mar 2026
 12:10:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310-binder-crate-name-v2-0-0f7c97900d36@google.com> <20260310-binder-crate-name-v2-2-0f7c97900d36@google.com>
In-Reply-To: <20260310-binder-crate-name-v2-2-0f7c97900d36@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Mar 2026 20:10:14 +0100
X-Gm-Features: AaiRm5115GZxyEEfPZfoYM6-RoPLVSwVPmOFZu_fwEORZG-eXpl6cSVm6btXalA
Message-ID: <CANiq72kPABmGHwRmAah35yvR4Rt8xLzSEhLJMOojGQt42y_QjQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] rust_binder: override crate name to rust_binder
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Tamir Duberstein <tamird@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Jesung Yang <y.j3ms.n@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: A1CCF256E04
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11794-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,gmail.com,linuxfoundation.org,google.com,vger.kernel.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 3:53=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
>  // Copyright (C) 2025 Google LLC.
>
> +#![crate_name =3D "rust_binder"]
>  //! Binder -- the Android IPC mechanism.
> +
>  #![recursion_limit =3D "256"]
>  #![allow(
>      clippy::as_underscore,

So the crate name is a special crate attribute (together with
`crate_type, it is forbidden inside `cfg_attr`), so I think it makes
in a sense to put it between the SPDX/copyright block and the crate
docs. I also think you didn't add a newline to put it closer to the
title of the docs, as if it were a title of its own.

On the other hand, it is a crate attribute nevertheless, so putting it
together with the rest looks a bit more consistent, and as a title the
English one is probably the best one to see first anyway:

    //! Binder -- the Android IPC mechanism.

    #![crate_name =3D "rust_binder"]
    #![recursion_limit =3D "256"]

Hopefully the crate names are still close to the file names (and I
would really not want people to abuse this...).

Cheers,
Miguel

