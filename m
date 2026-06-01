Return-Path: <linux-kbuild+bounces-13443-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDtyGg+PHWrFbwkAu9opvQ
	(envelope-from <linux-kbuild+bounces-13443-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 01 Jun 2026 15:54:23 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B4F620563
	for <lists+linux-kbuild@lfdr.de>; Mon, 01 Jun 2026 15:54:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AAFD83014A28
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Jun 2026 13:51:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B8753ABD8F;
	Mon,  1 Jun 2026 13:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j6RbfrGr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B4B3AD520
	for <linux-kbuild@vger.kernel.org>; Mon,  1 Jun 2026 13:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780321872; cv=pass; b=mhbn+ZoWKGF+2sHqsXdGr5gICMFncBmA8epa0ZrMzKoX4u6bocF0BYjk12mELtzueiUd9DHQ9VOOXMzfVF5bWKBPZvWzRaEzDtQPhGl7w02G8ZpMqdT1fLaCYq6ynAYd6R9O1i3zGUz9nf9rclgVd5hcgeHwhgY8nMumMWx6QcE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780321872; c=relaxed/simple;
	bh=r/oT687eVRP4yV0RK814W+7Ioe7FWGW2hQhsq1wvEnI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lXsh/rjq/dmlmR7JvGd2WhuXfnWS0ENo6ufSKT4Ka7igOM6b2D7Q0J+ujoX1IHSm7AUMZfdIfWefcZDB05rAGrnC+iYiSqAaMOwNUunuUW/YprYJY6A22l5qg4hbRHbpWHczRbo/b2KSnwT8tfKAD8s5+hKzJQnvaAQK+By3eac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j6RbfrGr; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-13644e164cbso325176c88.2
        for <linux-kbuild@vger.kernel.org>; Mon, 01 Jun 2026 06:51:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780321869; cv=none;
        d=google.com; s=arc-20240605;
        b=TpkvmHABngQIWOEBAH/TscRzcN+kFxDIP9uKmNv9XVpdsNx3ThJ69IiMx4Cp6r5gq7
         BD+KaT1in3GkHLL37jqxPIeL/+gz/vqSsyiiHMb1mOERQp3VX65w0RlqfXP4Sug1gdJt
         qDrIh1sf7e/EB2gywPUZe9dKslaa9W9fRK36JlXz4tildI9XczmnsSij4hVvgcaMX/jq
         b5Sij89KuEPSkGb8SANZhORsgT5OV5hPylJYaD26BI7FzORIY755/BWP96J53nHqZ+wa
         KiAIzlOKyDrCkxF2kJCbfupQVDCXppQwmRbGqPRuxXLzFCZx1+O6wKbA5B/rlmIqBx+F
         waUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r/oT687eVRP4yV0RK814W+7Ioe7FWGW2hQhsq1wvEnI=;
        fh=ahrP7igtCg36IoQ9U3h1DIu5P50B/2cdXZOzpf3Xupg=;
        b=drQC4yOE+Zt1VQ6g7lZFeUKIGaEtW9SjRUxbs+LacEesZcjN0Y4V0f26w9ZbFWZtbU
         WkyfQuK1Ta8p35DalLSI2YtnscV32kmDcHVAt5VwOW0WjZQJ+CCu1XUojeWeVvtz/8+Z
         3I1fJZpZHFeG4B7oWTMwNr5tMWjA3EXUjihszOUOkezpvd45MGSc58+S7Dhv2kHBiQ2D
         ApEXFCwQAc0UuTYxRxJXf4RwbqHSDjEEmuH/SbIxQbw+5sbAn8tifgVm0HqiPrtym31t
         LWF9MNcEpCuoyao5S9nr6Zve7mUq8Okc8MLmzS07t4EhuJvB1GLERuyqoj6NkRAG9EEb
         yKyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780321869; x=1780926669; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r/oT687eVRP4yV0RK814W+7Ioe7FWGW2hQhsq1wvEnI=;
        b=j6RbfrGr+IiCQSUJU0CCgzjkk7ezQojqbUylqJ5WYigR5NvKETewBS8CYEe8YE1Dqd
         7CUaWKa97LqOrq2I583PYGa5vQfsTtLXnfPpVGfXAEWpMr4CpHupJy9eUm77VWWzzHqm
         fCcRuJvsqR+yzPnqJPUwd901sUXqWYoVyZtFfZP3NCeDUHR3xvJL5aQg4ecAKdfwOhQI
         lkMg+lEHK3/uQgOlviU5ucM6x2f4h999bQsPLKiR2IpMZRCf+U30c4Dl2sahRLMICeiz
         5CHoawJGNXKGKrkMuJrGToXCEQKvil0SpVA1o4u8wTgBKahQ+uXzh2C60Tfrdqfjee51
         QR9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780321869; x=1780926669;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r/oT687eVRP4yV0RK814W+7Ioe7FWGW2hQhsq1wvEnI=;
        b=IrhHBtUHTapdl7Dh9elR2QMX971eyY4sAbvTwSigr4Ik39kLqF7KBn8PrzbghdGJoj
         WmXI525e9pZMABO86k2Y3Bde3rp2l/Y1JokHgsZILl6i+JmvZ/gmbDPIVce3d6bL9NUF
         p6Fz5UlU2qO7RiRxUe6+XJz2mk/7oX78srlxHVNX3pO9ZYLkquQf3NgsVw01cbXyK8Fu
         pJ5QxL4kVj0xg5B5TvOiXyk8ILBC6xpzd8MoOgMqUsrXxdTG43kLeINYVbOp2BotpvZC
         ZN0YnZbx78QkFDLGe4Cbn8UxObXMdSP4UbnvAiuKSTvsXOzuAhniLyAhhHxnJxXoJsgb
         UpXQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ZSSZi/q5pYyWfxPa5hS5iQvHdWhN7cki4CyUf8vZKvDAW+Cl29JpjfgcnWMO5HpgdeLr8Pk4Mci7Jz5o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvUcnSIeDltxZ4psUjY8btVlR1joFukukeFPLO4XPguSzU8y1u
	PLLXMDgaBWi/YW9pNA6O6hWtXAbZMedidxd04dm02Z8jRrW0cVMqUYojM/qiZBiFQtTapQnYDMV
	FHHxHcX9XbgyGns+pd1qxwdcLTcL6hF8=
X-Gm-Gg: Acq92OGfi6WK9fzrKx199qG2gLQPafLTADeentEpCORC1nbX2RtAluI5NCEhqi5nN6E
	LyGhzwVBYY+faGW/KaVPWzcfj3WcB8Xgdi6xMAxSCOf1tB+2+w1a6zB28GOsg1rSUynDVdRKZOe
	2mnWt0AQjPQW6QURupvCaNn1FOSUgv72PDDo+dK5y65K4LNifE3EzCwXEpRqrEKFd6xdjuhf0oM
	Mc1esJVORGsFqNh7lNO9UYcRRROPhMLEkZThaHsEg2PZH3VqyuvtYLEohzwivxxyORaafmXO9SB
	ABjw3hcUIUMi6ylZnaTO/1MGiBQ4nUkzApfA3e3zwPJek0otFsCItYRkW1qRneAUP8BjS/AMJRa
	I5QkrYNIk+OOLdQD7LLR2+UmKnAg2i6cmMA==
X-Received: by 2002:a05:693c:2c8c:b0:2da:b05a:5a7d with SMTP id
 5a478bee46e88-304fa31c4a2mr2349142eec.0.1780321869058; Mon, 01 Jun 2026
 06:51:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260530-nova-exports-v3-0-1202aa339ef7@nvidia.com>
In-Reply-To: <20260530-nova-exports-v3-0-1202aa339ef7@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 1 Jun 2026 15:50:56 +0200
X-Gm-Features: AVHnY4KWUDuK60JTIBwgnlL-tTjDarV9LStXY-LSeVpwOJ2FNQpjnaTpcPZMaew
Message-ID: <CANiq72kbzmLeFv58mkiKn+LvhCXmH5g7UsnTYTcVmJ6kyc+vLw@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] gpu: drm: nova: enable calling into nova-core
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Zhi Wang <zhiw@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	Joel Fernandes <joelagnelf@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13443-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,ffwll.ch,nvidia.com,vger.kernel.org,lists.linux.dev,lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,nvidia.com:email]
X-Rspamd-Queue-Id: 69B4F620563
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 29, 2026 at 5:28=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> In the meantime, this series introduces a Nova-local workaround for
> `nova-drm` to call into `nova-core`. It generates the `nova-core`
> metadata that `nova-drm` can use to resolve references at build-time,
> and also builds a list of exported symbols for symbol resolution when
> modules are loaded.

The "local approach" is essentially what I suggested back then, so if
this works for you then I am happy -- with the understanding that we
will replace it with the global support soon (it is good to have a use
case in-tree :)

I see you play some tricks to get the ordering right, including a
sub-make with a double build of the `.rmeta` in "private", which in
turn forces you also to do the `.o`, right?

What I originally had in mind was simply to do everything from a
single parent `Makefile` instead, precisely to avoid complexity (after
all, it is the local approach, so you don't need to force yourself to
handle that). That should remove all those shenanigans, and it is way
easier to get right. Did you consider it?

By the way, I think a `.gitignore` entry for the generated header is missin=
g.

Cheers,
Miguel

