Return-Path: <linux-kbuild+bounces-13828-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OXBaFoL3NGrVlQYAu9opvQ
	(envelope-from <linux-kbuild+bounces-13828-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Jun 2026 10:02:10 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2D26A47E1
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Jun 2026 10:02:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=NhjZgiei;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13828-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13828-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E49863069CB9
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Jun 2026 08:02:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6965B351C3B;
	Fri, 19 Jun 2026 08:02:07 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA5233F38E
	for <linux-kbuild@vger.kernel.org>; Fri, 19 Jun 2026 08:02:05 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781856127; cv=pass; b=PwPxjB3p8LchYVQaPWeLkps7SeI33KAjiuagPI1ZYUb38XokJ9Q6eFKROqGLGj/Y3z7Y6WJrH/P7WfZV5qsNOdE/8G80zCbNKik+opeAdcErXMBS90Wcu9TQeYaZUBRAQidO0pTWfI+n2eYZGaHN7h5TIfWPD3tlRIt+G+e+xvU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781856127; c=relaxed/simple;
	bh=bEknJwd69BPqBX6M20MiEGYpWE1pn2YGl/7/sZbmkec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BIqvQf6+38Ubp0b3rqSGa/R7YqQ6I8iYB5nVkB7PUAgCY8N6q0wXkM4naNrr3oGhzbh22AVK5wcHxO7RJfUdpDBH30qZBkNDkzDjvIuIVuEyxeyiSuI5kjUPMX0yVHpe2grmtlq0PqxMih9JHjPcWG3heCnSQuL4BD21+T9sFDQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NhjZgiei; arc=pass smtp.client-ip=74.125.82.174
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-30bd960e807so119142eec.0
        for <linux-kbuild@vger.kernel.org>; Fri, 19 Jun 2026 01:02:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781856125; cv=none;
        d=google.com; s=arc-20240605;
        b=YndzXVdp81RnA4yP4nuzmQZwH/tUUCI8gNjXQ5O6M3u0XLQ7B1pBsVM2hv8HTYX1jX
         XKO48x2L9JkHrt+i1e0x1f1EhLvx6kNVSFck5WxUOVKbbHjbCKDrK0v1uzmkI+InbJ6n
         zD62H1mgeiloZEF6Wl8lR8TuLmXEPosMZ9fSX2/9LFjZ68Vws30Vah5Ehciz76oJKDF1
         7h9XpNaTdw99YfIiPwQ87j126Dpq005dVwX8JZymxTIUrofQVeMhxmAqafivxTK8TTGM
         5L/rqI+3M8W9CXVGTyxjnDipjVWjJVIECsxN1v7RSGEp1me9nY7A8FJi4GLuElkzm+Qb
         J73A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0LWN2XMRPu5rGOrVcVSqlP/sQG3dCpjc7AShpqPihyE=;
        fh=d3x1N6dth0+GlFpVh24jWejd4ITAQOsm6pVbF/KojEo=;
        b=gi/aPP9BiV4PlzEeTH7JasqyReA7wdueg2fw0XsO6uAZjFmnmOFQg2Y9+EOlvsiz1R
         haGhsh8y7X509Dgb+YkXFuoGaW/4VyFFevZmnPiCQPPuYJysIB3BB5twkbQ3TzTKGDCT
         iKzhlbK3vnn8dp0e1E6a5VAdweq20yWhgiLSPj6Y3yVA/i3DKTFrsFvbEKkWAQEchOaZ
         TZOOhSM6xKbXpea+QKEHSGCmiyumNq79Mn8EAJC55VbMQWqOAa9bcqsbMa3F5M45zY6B
         FD6UG5lGHhlkNpczmuLsQJITixqulEYirhlkLgz0nGQ0xC9oQDX2iiS1XN6GpqScSX+g
         2Ipg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781856125; x=1782460925; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0LWN2XMRPu5rGOrVcVSqlP/sQG3dCpjc7AShpqPihyE=;
        b=NhjZgieiz/KKeqAUXR1dIKJNEVwgkPP3wUJn2+Ga5DZJJIhkPRyCENovylGoiyxQJW
         uKWdIJCAH2b9kj3Ugw+3U0r/GW2EI7CB2cOLR+p0MwFIGV7XcFcnhDefuv6LBp9gm/ur
         xZvufGSbnZdK9kJ9Nl4a4xxzV1EJrinXA5W+qm37rDfg/p8uQkhCN8V7c5O5FQD9tlCO
         tkM+8M6m5oa3FPwG1C6P6t5AfPFXE2YrXpGh8LkXolwT/djxRMyfSLwp8JPqx9UyYbt+
         OjQdfPXXZ0cJIq5xotVK0G36KvQqCQWW0nsVvzxmZSTTzNehRKJrOm4KY6axTeiInOPg
         Zb4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781856125; x=1782460925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0LWN2XMRPu5rGOrVcVSqlP/sQG3dCpjc7AShpqPihyE=;
        b=V3bMN1qE2IC1QB3at4FPTxhSpVyHPqWUPlMD5Ct7G/dIaeUHCWyDfGL9UnO5aRf9hh
         CpgeBYAnhVsudfu826xZ8J67RPZQaVa1FXAObcCzjvvkHg98SSvBd2v/mBsfF78uCNRh
         BNc84jh5UzThzi7Va8j6UUa2Mnz8T90FFyltCNvXQU5KXAca2kB0E8+n1V2hdfwXMLr4
         fRmBZO/rL44UzYotlScwU7JSjpPl7gd3DiFOr2/tKTbfwj7NRq3EcqRGRM3yihtyIIge
         cy/UUjMkrsVGgQ0plKlNATuFYdiURZhmFtBgrsMnja+VfpDTCyWXbB37Q/UnuxZ/pX5r
         hv+Q==
X-Forwarded-Encrypted: i=1; AFNElJ+pNpq/rieZFmr2/STPfp33hJ0o5JR+vZcCWpkAJEuKsdX9uf2EJNLL7bwoqtWhKziMjhi6WVIPesN8zYs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7yA+Sonthd47n/kMG0OW24XDeMm3KbX861egDb45L1FiSq9s2
	s/4/iCkZ8RamU8R8i9OPTnLRZRDpXekTbJVs+eJqFhPKQ+fhsaxF429dq8V43v/nCEXUjVS25av
	q7ir8zr3slaJIZ8uXqhgLnDllwEJwiW0=
X-Gm-Gg: AfdE7clAS0xB1Js1iE65RIML0nJwhS13fECyjIqAhs22mrjfjq3X6BqO9zoxb9oLjPL
	s78xC1bJG6sCcFouGSqypQ4rfvGKJeWCBPNsD7XZbHvnLBWpUYm7upSKaF3xu32yVKew4H53V8T
	mikKhFzeTlA48AHDB1vYp6BelQ1lzIEiWvFC9dAMaYJieSc/jvE6lE9YpBvDv9p8QBTC9r03WkT
	v5onxMQwbZdU2AzcciW9ek+1Ah7av/YF0xKmnSbkTqIESmXpjPcArI+oQmY44QlyPz8hhxhckWy
	La0BwUy6WE0C4gH4cTGdLIpIoyoMVvgmf7Hl+XlBk4XB54LjHnB4eyD889k9RRc/6tQDBGwMkh6
	iD88glRIXfJMm
X-Received: by 2002:a05:7301:4083:b0:304:d700:1e90 with SMTP id
 5a478bee46e88-30c0710707emr738158eec.3.1781856124490; Fri, 19 Jun 2026
 01:02:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260616-frame-ptr-fix-v1-1-dc6b29a631d9@google.com>
In-Reply-To: <20260616-frame-ptr-fix-v1-1-dc6b29a631d9@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 19 Jun 2026 10:01:51 +0200
X-Gm-Features: AVVi8CffKMpkvKaXkC2a14km4xiSSCQKaVxWsJd6YpU-ayq5fx4Qr3XyLO-NClY
Message-ID: <CANiq72kbbhHA8d2wtNbaPR5Xx2kC25_D1r-EEeZWn7ojo=M7iQ@mail.gmail.com>
Subject: Re: [PATCH] rust: Kbuild: set frame-pointer llvm module flag for CONFIG_FRAME_POINTER
To: Alice Ryhl <aliceryhl@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Douglas Su <d0u9.su@outlook.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Fiona Behrens <me@kloenk.dev>, 
	Sven Van Asbroeck <thesven73@gmail.com>, Kees Cook <kees@kernel.org>, 
	Wedson Almeida Filho <wedsonaf@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:aliceryhl@google.com,m:nathan@kernel.org,m:nsc@kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:dakr@kernel.org,m:daniel.almeida@collabora.com,m:tamird@kernel.org,m:acourbot@nvidia.com,m:work@onurozkan.dev,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:d0u9.su@outlook.com,m:alex.gaynor@gmail.com,m:me@kloenk.dev,m:thesven73@gmail.com,m:kees@kernel.org,m:wedsonaf@google.com,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:llvm@lists.linux.dev,m:stable@kernel.org,m:nickdesaulniers@gmail.com,m:alexgaynor@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-13828-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,collabora.com,nvidia.com,onurozkan.dev,gmail.com,google.com,outlook.com,kloenk.dev,vger.kernel.org,lists.linux.dev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BD2D26A47E1

On Tue, Jun 16, 2026 at 2:30=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Due to a rustc bug, the -Cforce-frame-pointers=3Dy flag only emits the
> frame-pointer annotation for functions, but not for the module. This
> means that functions generated by the LLVM backend such as
> 'asan.module_ctor' do not receive the frame-pointer annotation.
>
> This is likely to lead to broken backtraces and may also cause issues
> with ftrace if these features are used with functions generated by the
> LLVM backend.
>
> Thus, use -Zllvm_module_flag to work around this rustc bug if using a
> rustc without the fix.
>
> Cc: stable@kernel.org
> Fixes: 2f7ab1267dc9 ("Kbuild: add Rust support")
> Link: https://github.com/rust-lang/rust/pull/156980
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Applied to `rust-fixes` -- thanks everyone!

    [ The fix [1] has landed for Rust 1.98.0 (expected release on
      2026-08-20). - Miguel ]

    [ - Adjusted Cc: stable@ as discussed.

      - Added comment with link to the PR, similar to what we did in commit
        ac35b5580ace ("rust: arm64: set uwtable llvm module flag for
        CONFIG_UNWIND_TABLES").

        - Miguel ]

By the way, as far as I understand, the `vger.` version of the Cc:
stable@ address is the one that should be used normally:

  Use ``Cc: stable@kernel.org`` instead when fixing unpublished vulnerabili=
ties:
  it reduces the chance of accidentally exposing the fix to the public by w=
ay of
  'git send-email', as mails sent to that address are not delivered anywher=
e.

Cheers,
Miguel

