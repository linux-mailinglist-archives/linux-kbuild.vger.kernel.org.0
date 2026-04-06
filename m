Return-Path: <linux-kbuild+bounces-12696-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LfwHdIE1Gl0pgcAu9opvQ
	(envelope-from <linux-kbuild+bounces-12696-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Apr 2026 21:09:06 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 310843A6807
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Apr 2026 21:09:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 81DE0302293A
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Apr 2026 19:01:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25085396595;
	Mon,  6 Apr 2026 19:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xn7sFvfz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F2D280309
	for <linux-kbuild@vger.kernel.org>; Mon,  6 Apr 2026 19:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775502110; cv=pass; b=oP7J5ZDqPbaxMLPPj/yZtF+W23TIXpABuOYo0FxjoHHOR20lv7fn+JFp4s8bJIrgOqd04EeFvpYjIvITGkqAkNUuxjCP+pqQcu3mmOFBE/OVDegbvWTU2u4dYzfMfzFcdQzMjYmt4F0H/AhSYncEkghEffeXLqZVNLfb5O8UKts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775502110; c=relaxed/simple;
	bh=WRVPBP1r3UEupcj81ppPFlfizIU+h6eu8Pvb+T1BfIE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WsRG9egQvZ1SbIoIj8RUL1WB0yvy51LKnVf8YtIm/2wbdiUkynNlqiB2DA76b9hTe3NRhXm5eHrOyaJLDM+ysx9pdSXtHycAq4ob2ZffHO7Irj9qospbnDo4E28Or8S/NaI6ggKS5wvYakHZO7guQT21laDvenucHnpqPJI2mMo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xn7sFvfz; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2cc43ca447aso146048eec.1
        for <linux-kbuild@vger.kernel.org>; Mon, 06 Apr 2026 12:01:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775502108; cv=none;
        d=google.com; s=arc-20240605;
        b=Fjxz72XCYEkz0KaxjbSmsrozVhfsxn2QzXKH9i0o+uWcnIClWZgEcdv/UixzmsWg6P
         PYX4/36Ym41Cb76gBk/3i0bn4T86mRczVXYePHNx+Y1r5k6FMlTGsv9uePYnNDUkvybd
         iiOwYY7+bhdZ5X12eCr0QDsRM3nUCSZvg5A5WFjqWvUcxnBKh6HJMXjtF/WH2mUmGagv
         ZPrX0UbQHd9yi9LSAeKXab80l6sFR+lTaFc1l4RQfJU3TIZ1fVGd80RUFaoS3cy7qPeF
         Xoqn7DIgUoBF27A3RqihAjvcu3wnJ/0rQ+0oUiVMF8D4Yw6TzyZVKh/GQZEpWZoNPRSr
         Gvew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gf3VuwShgbYg5PZ/J/6LyKGap1JcrY8bWhqVawvmQIs=;
        fh=U+gDyQf41Nu7q5BuI+CpXo1c/swZqs+BdVZDFS+CCBM=;
        b=J2C+WzWDfhlGO4iLFE0pd3e11qROtD/x3XdWQDk7S22qcW9hGTL2a0WTBIJOfJ0zcG
         3PXNoguebpcsjQjUQ82XqzrdY/Z6qjeC5BpIHGZzyvJAouQM1J+5b4/EPWYtrtFk7itg
         usQRcqKnU/QHZJ7Z/TiAOXDsjC6qJCnEZUkD40gqX87+XNduUUL68ywl8dsM7n1UAK1J
         Mp7rNd1+0oOUuDpx9O6qtb4UKZl4UXW6nm8mXxBTa0uZIFZAvfEvECiv89U0nu0CKuIg
         8dQykLOcShy+HrE7E65Y1FhP4nX0Xh/pcBVrBcvjh0n4uoUQIJX/QJR7RXtlyO2WfUPL
         xzVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775502108; x=1776106908; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gf3VuwShgbYg5PZ/J/6LyKGap1JcrY8bWhqVawvmQIs=;
        b=Xn7sFvfzRt9G0FrCZPuRREVKeZOHqh/la5bppkaKs8mMh4RHCWrQNCcSCneN+bMK5W
         1Y/dTLBK8jVnry4fmyC6KTYSpgc/2nf0BaC/v1XafHg3IqhVICMt5dA6Bgy6J9hNN5el
         xKLZxlGoENIhb9GcLr1vkwEszZrHpge/OVzkiMhoB/2H24BFDaQ8OA/MooOP/S6tc0uA
         HwvkyesOG4D1To9WLTTQnWG+ixbv8ZGY9bYJU4sS3VHu24coyiphoELx1MtMKsppQzV5
         IDD9W7su2vaUf4wW4+NTW0vk42O5er7xMJR7a+4MWeoefRbQDYGiIN023PdpUsVkgia3
         LTfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775502108; x=1776106908;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gf3VuwShgbYg5PZ/J/6LyKGap1JcrY8bWhqVawvmQIs=;
        b=SIrkMsgW79guqpTznAwya5HeXdvm9L7lsvClkfNJXU4UNey2TdltBvvhxrGHpMzAKq
         luCnIVAxTvN7OHeJMJCm4v7VuPhdaiwFPGuBfujII3UxPMARAzaHaRO8NkQb2RjAfRh4
         IsjD9AfeaHnEpqSyCJMae6KUgddR9Y/G3eJVbCogh1LlSsOsflq2ubWTJZkWWuryuTRg
         DZYqd6yX2GkwAcU5YqZUjVQuJNvFcQ4n9HVXxyVUisCj2WFxK6zIs+WiELfnt0DImg03
         /JcFaHmDBO1knn/+bigPCtlVgHeMaAm4W7jHdye63racmk2PbsOo4Jq4BoydwfnHnql6
         CL7g==
X-Forwarded-Encrypted: i=1; AJvYcCUKLqg3NWRd882mjiUQYg2KPkoWZ0Y8jsG53FUtjRzzk+CjpE22UQBWJlXWJPG6BNsCqo8gkB1zpPMweOE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxle2C3lfh3iIofrkBRoBKtHbEr+VYr0m4lUkDPZotQ6VH3Bkmk
	YbLDaOb8L8KAgBj0f2un3/JsZHjqoiSFP1IMS5ofeFyuKTQ7cnasmPbZUY3TII+7Qj49InNbjIx
	ij7GZsVHXhRGTGlbLV5tvnx6RlbU4gsw=
X-Gm-Gg: AeBDievjHm6QTQzSVzOlc1k6WsxKMjcdUOo+n/FwqtQZLYp4TlK2hFQXLgSeX+dighA
	ekExwXyergoxb6g+mkZGGV2mM+9etAKZ49PWjTJ4qN7estnxwTt6qx71j72gFw4UqYFbeBXUIB2
	N3GNvR90E+nolE61i8AYINp8gGCgyXhicLlRuq3kF64klUZZuoaK75s9A+regWGAF8Bu9oaqzSQ
	FBM6TId1eEv2LhfrbZ6OD4mHaRhcT+U3X0g5LKGaF1UvxyCBApkBBJTVBI1KCI+2zJOgY83gUeV
	tBQEO5sx7QQMD8KpB+ad5G1QCniZVAMoXLZjWSGCeZTzXiF3C6osPf1bwggHEBpRfzN1hrZhESY
	idq4nzrjpceUZ/W+f9Fqo9m0=
X-Received: by 2002:a05:693c:2b02:b0:2cb:6653:ea05 with SMTP id
 5a478bee46e88-2cbfcf5295fmr2949463eec.4.1775502107727; Mon, 06 Apr 2026
 12:01:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260405235309.418950-1-ojeda@kernel.org> <CANiq72mnGArtgAbe7xXZCYW1x7Zd5hozfnzoftaGy9rxoLO4ew@mail.gmail.com>
 <cf28afe0-ede5-4d1a-9824-65a1448f8161@nvidia.com>
In-Reply-To: <cf28afe0-ede5-4d1a-9824-65a1448f8161@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 Apr 2026 21:01:35 +0200
X-Gm-Features: AQROBzAfx15_qleB1FpEnqVT3LDjlhAucDNDkuNXvaEMC2J19jPyg217OqF9cWw
Message-ID: <CANiq72n4tmTzqbcHCnzUBFyLVmJzB-AJng_1FgELJCWr7hDg4A@mail.gmail.com>
Subject: Re: [PATCH v2 00/33] rust: bump minimum Rust and `bindgen` versions
To: John Hubbard <jhubbard@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [8.84 / 15.00];
	URIBL_BLACK(7.50)[rust-lang.github.io:url];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_ALLOW(0.00)[gmail.com:s=20251104];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-12696-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,body];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[49];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,dabbelt.com,eecs.berkeley.edu,nvidia.com,ffwll.ch,linux.dev,davidgow.net,linuxfoundation.org,android.com,brauner.io,google.com,lwn.net,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,oracle.com,gmail.com,lists.infradead.org,ghiti.fr,lists.freedesktop.org,googlegroups.com,lists.linux.dev];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c04:e001:36c::/64:c];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=2];
	NEURAL_SPAM(0.00)[0.998];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,nvidia.com:email,rust-lang.github.io:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 310843A6807
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

On Mon, Apr 6, 2026 at 8:51=E2=80=AFPM John Hubbard <jhubbard@nvidia.com> w=
rote:
>
> Looks good from the perspective of this patchset. I am seeing
> one remaining problem that we previously came up with a fix for,
> so I expect that that fix is staged in another branch. But in
> case it's not, here is the report:
>
> On today's rust-next, using rustc 1.85.0, at commit 232e79c72f57
> ("rust: kbuild: allow `clippy::precedence` for Rust < 1.86.0"):
>
>   CLIPPY [M] drivers/gpu/drm/nova/nova.o
> warning: consider removing unnecessary double parentheses
>     --> rust/doctests_kernel_generated.rs:4240:14
>      |
> 4240 |     pr_info!("The policy details are: {:?}\n", (policy.cpu(), poli=
cy.cur()));
>      |              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>      |
>      =3D help: for further information visit https://rust-lang.github.io/=
rust-clippy/master/index.html#double_parens
>      =3D note: `-W clippy::double-parens` implied by `-W clippy::all`
>      =3D help: to override `-W clippy::all` add `#[allow(clippy::double_p=
arens)]`
>
> warning: 1 warning emitted

That is already fixed and in mainline: 487f9b3dc6e5 ("rust: cpufreq:
suppress clippy::double_parens in Policy doctest").

Cheers,
Miguel

