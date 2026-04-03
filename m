Return-Path: <linux-kbuild+bounces-12634-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLjIA3jiz2kS1gYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12634-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 03 Apr 2026 17:53:28 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B3F395FB9
	for <lists+linux-kbuild@lfdr.de>; Fri, 03 Apr 2026 17:53:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C629630041DF
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Apr 2026 15:53:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EAD33BC689;
	Fri,  3 Apr 2026 15:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NjFAMa/4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271E23218B3
	for <linux-kbuild@vger.kernel.org>; Fri,  3 Apr 2026 15:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775231597; cv=pass; b=Y9wYU5nCL8Jvj6It+09wOQjTFQzgolo+pIZAkjQhE/nl5IbS0X3D4v5tiLs/Joawgf8XkJJnOFF/fKUxQHR8/9IM0uC6xWZ6v+1fwQ5smKGrcw4aSRZ/67NpvYKUU2Xc76uPafgrStFMCIMjJYZV9xPukS8sGHgH6z0GZJdkI8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775231597; c=relaxed/simple;
	bh=t23z0PvZ5SLNM3iOMGWZAQbIb7X50AxZc0jqO7F0tJ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IWgaYYcECSXbG0hNEELfmfNWFX0fViuLPdal+jvpJUnQcFKSzKWGAAAtpiX+yorgfs+edhWF774US884vgAV4zKyuvPzklo60cE8n+9q7Z4Lxp03H03qpO/pz0Ym+YmD1/1WnYiad7WmPYlKwJmSr26W6IgCFlS8/DoU+iRLhgw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NjFAMa/4; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-66baa7fdfd3so7841a12.1
        for <linux-kbuild@vger.kernel.org>; Fri, 03 Apr 2026 08:53:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775231594; cv=none;
        d=google.com; s=arc-20240605;
        b=iqS2eA8J8rXH5rFrZ6YLVQlKC89fEqXl+KKnUY5Mx117jNfnYVrt9CNYoTKow8ETLK
         ynogFFGRhNh38sTVObEIknaL8VG63ePIZ34sssxlWl40s3sFLsdwYe2g9wrR9YURQG41
         NVg5CsuFm0Wo+YzRffP4XznJFN0ZTxFbnj3ZU3XtfA2WoADPhM2agFwv9rcAvf7jSQNm
         /8dLGKDqj77KvaU5jsXgFd1Gj1y1gb5hrYIC7jWr1IG2smSjJYv4jDhPoZlWXYus67GS
         IO17oFpkW2X1QXWkx5hCTImwcyErT3qDUoApJq0O2ib2jyXNczGd80xbpFXdFXV6nnLf
         mI4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=coqr6EFlArhl/x0h/ZohwmdyLe+IJgT11ByZbHHxjb8=;
        fh=Up/hLBXHKy9chFDbb8Qau6E26TXP+R175JxfJmPi494=;
        b=figzZGW7PeRKxWl3K/ur14xAjZ02ruqewFH2KMRO2M476Useb+YRqxI7veiRZnN/53
         bzhFR0GhLGH4gxIb7ElGrVtee1SphiefGh6h0i1R7Gx81WIfjiHyRUKvm8MIpumjNEVF
         2E5e0OnZB4iNv4Vx/wQXd816zweZBjEE1lOhCnx25EMazNvkiHRXe9IO3kIh5F1gZEb9
         jT3qy+Z6zvBuWAxGHOu5j9hVR9zR2gXaw0Kh19011ZHWVSjfdvoaH/c94xVcN3tGrr5q
         qjU2d2N/BD16upK03mxNQ9025gL2jfai03YntMFljGX6CHqWKb14KeTmCBeFrCsaagP9
         PG9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775231594; x=1775836394; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=coqr6EFlArhl/x0h/ZohwmdyLe+IJgT11ByZbHHxjb8=;
        b=NjFAMa/4gMTIyl7BlE0aQyZ1GJ+rVpy10ZCGEpSJ/JxduwK/HxPapOnuNDmM8yi0XL
         SJZDXBcBl1vyCSWAbiZcgPMQXpWU5jNGVHcHuaybl5DFK3N2UoCL4zYWIPH/Ay7n17oU
         U0QEpAgorn4C7554o/d/BOg0tfERKk7lnBAeSaxZNypiOk3sGQxVcMmqdk/Xd33+FFp9
         3xqtJRkJWutehg0v6hTx9YRcIQxaHhjmspQNxGGbsyDcjT6nzWncOwVEnQIuBK9+v62J
         4+7kOwppmVeW8hBhcnZwLfJKu8D/gaLZaqLtVn6jUoHa9DiO97vlq2o2T4PkUNAIxnZb
         cgmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775231594; x=1775836394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=coqr6EFlArhl/x0h/ZohwmdyLe+IJgT11ByZbHHxjb8=;
        b=kHBbq9Ynt2kNTUyR4ipP9ll+OFpZcYwdgUhTgZ8kM0Lfg+ewYSyKdcGVSwI7xesoBy
         gJt183dBl8C5QhnV/H6zy9wDxHgNwBjtJPBLJjbWweNhwAzPFSycJZ9QEdVq0Z5Kqi4l
         HwJKQPkI196pwv9Qxdna3b/9GKY6WeaYMbyTzhXH69rSJXpsGGijyDUyglO3x8rX1BCy
         UOIODET3u7mz63JOlRJvuj+ao0j8Ptu1S6MYgdAu3ATH1WGRRobrDgDzK04qgqaTdm2B
         4Kmr3hs79n9l8yGxNt1sW62rCr7LnrUQEupP4CKqKIUz7tdNV7kiQRyfYaCMl/9ms1Hm
         pHTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUt6b9SsXbY4YeXBI3RTAi5bUJ/HTSXCoIvKN9LIiQC8sKih5/xTPDU/KCkTRq7GNYsl9vyaa1nOoz9oNw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNtMg2o4B8mLfn8H1wXucNvimrqvXMOSjL3JtY1IEo2vFcxyHp
	h1SjOH7PKCsOTq9Jdg54LJakwJC12hnf9QNAewGI5H7ldrIBO/OFbfoq7xYXQ1OwFQ8sSQcPiq2
	XHqSyoqLCuT0XTwU+omY/OMPUp3EAGE2GLN7GAyNM
X-Gm-Gg: AeBDieun0dbHtfrjTrvZYdXvxHS8ezShiP2ZeyZNDt2199YM60wEHrYs2ixTEwnTag/
	szA7WFj8rnyLS4J2tcb+B54MSne34Q6jlfa/Q9auU7mQEHWPKhfkR5hITn/cT/LjTg/sgvR39xm
	8dwSoLAwdhg9WFL1KkQvA/uihMwlnPD3ImIGvPrTNI1g8aDEOrM0g0Vv7Tq7qPZquHpECaZhoE2
	0kIOYM3oIgrSoTljXenhAxUi5eUuPM761UWO/XYyvplMwSMvztaXlLg2IrEuuJNTDwfnvUrhf9a
	G1Dxizw60Rm/d9M=
X-Received: by 2002:a05:6402:4244:20b0:66b:eb42:be7 with SMTP id
 4fb4d7f45d1cf-66e43f7f81amr19687a12.13.1775231594022; Fri, 03 Apr 2026
 08:53:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331205849.498295-1-ojeda@kernel.org> <20260331205849.498295-2-ojeda@kernel.org>
 <CANiq72kNqmGpFurRy2X+a=9fHV_hxpfWBJ-+dEL_qj2daLM8ww@mail.gmail.com>
In-Reply-To: <CANiq72kNqmGpFurRy2X+a=9fHV_hxpfWBJ-+dEL_qj2daLM8ww@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Fri, 3 Apr 2026 08:52:37 -0700
X-Gm-Features: AQROBzAYADRZHwIlu_Hu7-_xFAf5tXH5Q2bpU3B-T608yTRVpmc4-aeDHJhGvtI
Message-ID: <CABCJKucPKB-ntYi=EzPqyypy0kEHwnZvEvCEyjdQUWqfeAnGig@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: macros: simplify `format!` arguments
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	Aaron Tomlin <atomlin@atomlin.com>, linux-modules@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [8.84 / 15.00];
	URIBL_BLACK(7.50)[rust-lang.github.io:url];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	R_DKIM_ALLOW(0.00)[google.com:s=20251104];
	RCVD_TLS_LAST(0.00)[];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	GREYLIST(0.00)[pass,meta];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-12634-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,suse.com,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org,atomlin.com];
	DMARC_POLICY_ALLOW(0.00)[google.com,reject];
	TAGGED_RCPT(0.00)[linux-kbuild];
	R_SPF_ALLOW(0.00)[+ip4:172.232.135.74:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[samitolvanen@google.com,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=2];
	MISSING_XM_UA(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.989];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,rust-lang.github.io:url]
X-Rspamd-Queue-Id: D1B3F395FB9
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

Hi Miguel,

On Thu, Apr 2, 2026 at 9:53=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, Mar 31, 2026 at 10:59=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> =
wrote:
> >
> > Clippy in Rust 1.88.0 (only) reported [1] up to the previous commit:
> >
> >     warning: variables can be used directly in the `format!` string
> >        --> rust/macros/module.rs:112:23
> >         |
> >     112 |         let content =3D format!("{param}:{content}", param =
=3D param, content =3D content);
> >         |                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^
> >         |
> >         =3D help: for further information visit https://rust-lang.githu=
b.io/rust-clippy/master/index.html#uninlined_format_args
> >         =3D note: `-W clippy::uninlined-format-args` implied by `-W cli=
ppy::all`
> >         =3D help: to override `-W clippy::all` add `#[allow(clippy::uni=
nlined_format_args)]`
> >     help: change this to
> >         |
> >     112 -         let content =3D format!("{param}:{content}", param =
=3D param, content =3D content);
> >     112 +         let content =3D format!("{param}:{content}");
> >
> > The reason it only triggers in that version is that the lint was moved
> > from `pedantic` to `style` in Rust 1.88.0 and then back to `pedantic`
> > in Rust 1.89.0 [2][3].
> >
> > In this case, the suggestion is fair and a pure simplification, thus
> > just apply it.
> >
> > In addition, do the same for another place in the file that Clippy does
> > not report because it is multi-line.
> >
> > Link: https://lore.kernel.org/rust-for-linux/CANiq72=3DdrAtf3y_DZ-2o4jb=
6Az9J3Yj4QYwWnbRui4sm4AJD3Q@mail.gmail.com/ [1]
> > Link: https://github.com/rust-lang/rust-clippy/pull/15287 [2]
> > Link: https://github.com/rust-lang/rust-clippy/issues/15151 [3]
> > Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
>
> I will pick this one up together with the other one, but if someone
> prefers that I don't, please shout (e.g. if modules wants to pick it
> themselves).

Sounds good to me, thanks.

> An Acked-by is also appreciated, thanks!

Acked-by: Sami Tolvanen <samitolvanen@google.com>

Sami

