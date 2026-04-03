Return-Path: <linux-kbuild+bounces-12631-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCTZBlmTz2nmxQYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12631-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 03 Apr 2026 12:15:53 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B11F639332C
	for <lists+linux-kbuild@lfdr.de>; Fri, 03 Apr 2026 12:15:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 286823016ACC
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Apr 2026 10:07:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4029389102;
	Fri,  3 Apr 2026 10:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="djt6QZTR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11054382F32
	for <linux-kbuild@vger.kernel.org>; Fri,  3 Apr 2026 10:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775210839; cv=pass; b=idI+58x7a5NTVEdnto7r5p4h4oDcBpFGmFcAxxyITANDtjrId7i6pxf3Oc2FNk5VFX5q2JWFnH++5l7h+gP9BuTOK1AUdHsdaSsoveD+C52at2VkpmNZ9OjauwtXF8emoYESoY+RODyLu4HT4u/U5YZvWKNUt0o4z9YMWxVzuIU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775210839; c=relaxed/simple;
	bh=l6iFZzW+AWF3/QEU6LglpEwpw23G8B8xolbXTX0zh2s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TU4xSK3Y2rOepfNawIxy0jgvuWkVvxLdBAPoN/0ymEEMPKyD7eLXRJ05FVZ/7hd7enRXK4DSmQrFDRwcu1hoGpOTZ20qepaF2ANL9NYVJDrSDp+Wo+f0PXUAAXkHmzl1ngL11woDGnBWzrfxGAhU7NtFR6GF7f3WploTvNfGzCs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=djt6QZTR; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a2c77b2157so147006e87.1
        for <linux-kbuild@vger.kernel.org>; Fri, 03 Apr 2026 03:07:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775210832; cv=none;
        d=google.com; s=arc-20240605;
        b=B8yWMWOn3uLG0yKP5CzzmJzqd17IMOcsspQtloXv776DKwdpcV/PL3MyrW1AN2Rfpi
         YpPveWf/9bPxgKPrq77X3zhULDJZFCieWfrU2T0bvc78OffX1B0RTcWDVU6mImSR8fIi
         t0IfRUGzmkj89YL1VktDhbmiZx5YjmRbM0HYIX03G4FYG/Go4VFny6LFsg243gP2N0Zk
         KdAeqqKIp26mYO2uIj0+Qw7cpkpqAQ/LTuMlac/Dq9Tq77jwOkpCKZ1frs21KIsk6SM+
         GC+hYu3NNj611oUIcd9pRAchimhkP2fOWn6s0juDjozh2Ie9r9oevtcrTyYjZCp+v8Pc
         K0Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oPJMJaHpZbFcRCyZeIIkk5jL0cCGPysTlsDPbLnYuac=;
        fh=YqMtcaFD53CKroOklUL45E8lvee+CGgCeFQoZ+HQEcI=;
        b=HzjW5Upy6gj2jY/lNdSO+IAxYJSo8Sik8y5Pp+buhJ7ASnrmt/evOTNdTF786dspQ+
         O5k8dtW9yOVn2USelNi63SCPJd8yC7itTKI4Kv8jeCqnmYUP915O5KlP/3kMj+ZDzADx
         i2Btw6ZqpuN3+UyTTg02BNCL3prhwi+NNYC+abda84AtUCULSPVhzOhjQvIcbVgduER9
         ud7A8sFCbmZdqMWunDnzNyhOomkyIw9BeyUAe+lkRKiVSmPwSPmLbwf3dujttIfx3AeF
         cZz8UdP6kp1nrRtV1HFCaWpKBO5IlWX+rQIUTWpXTCuzhy02jAlk3LDSQgzat5hUi/NP
         aveg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775210832; x=1775815632; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oPJMJaHpZbFcRCyZeIIkk5jL0cCGPysTlsDPbLnYuac=;
        b=djt6QZTRfT+XcEa1NxzzaJE1gUQlCKaKO6cK/w6rS80EpPop3wYhW02DcP4gx/OMZ6
         yMOvMJMI6seSsYr53wjzyZ5u3r4cd4EXtwf9wRNLRUpgxbDLwI8BNEH0tJG4zkPyX2am
         5khpWbmWgBOe0AfPhHD1CirtkaPoet0ny8l9uSKSrHxiS+DHLiBZmVa41briIfrMxbP5
         gRePp3b4PvkWE4FhUxRkDjnABs/c2zamHosaduIZbyFCb6sXEd5bNVeArrt8kIbLjSu9
         1KazumvICrWNBZWF0T9eFIkwJTD4Bz3CP+qSwmJx2PRff/bUHuHf3QDKBc/iYdidY1il
         UDpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775210832; x=1775815632;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oPJMJaHpZbFcRCyZeIIkk5jL0cCGPysTlsDPbLnYuac=;
        b=SoIfnG7rBOcjktTvI5YX17ESYNRNqIxN+l9YYutjx4yMdl484Mt+S88uYQKrNNM31B
         sFYTed6c8j9Ouw9jVuskYQSYeoOBa7eoQfBFrZIWHYIdbYxKoIXfFJ8MHXT1Dp3tC06n
         Lmp0VDCosK6s01wdUIhSphsrm1BwJadeYjJihy13l9jqEWjmMxynB7Uvh3Oi1KB5fcbs
         NeshDcNphhjO5QzJx2Ci08JlzsbiVLdOrIvZ/NdwnlDy9SCrLkezjCtMTb0D05YyvgKB
         6AMVUN6u+VlalXbf/XEIk2yD4Yarj7owIJwM6V5Za43sRPLTgF51Kt+iH2Ua9kmqbK2n
         nEtA==
X-Forwarded-Encrypted: i=1; AJvYcCUKMNsUaCibPUR4CUV+MGzh/P7vlFn6wVH5fdn9Uf9jHOOL/GHhjSfQHCwuDxdB9XKLcyj9Tjf/gIXPWV0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFM5cY/RUn5hb8XoqPGf1V25ztJoM9etice+ka8n3bD1seNW9Q
	xrGbH81Gq/POcvbt1WfbPrbRSOAfChx2YtNMXpY2fTdh8m3+rpOB1po8qsVlz35qYv9F8UWpQ/m
	IPEzzRMjOtS1aIkaRDLe+x9YEcchUW6k=
X-Gm-Gg: AeBDieurRHtoRFSYZ2hFVjLp4Uh4nirhPyiD2Dz7G9GKcDy4dml9pqqDxvw+M8znMv/
	I2OmlCziewz+K20Q3p1gIn6a+RG/EdVEOAT8jlLbNznaQHMRwad1I6+oJhmfj7Ao0Iuglkvj5TX
	cDSjEuvf/BbiGEiF27bvrawTJPy+s/FRXDrXQwhDueWRpttfH+DJMCa5hHH9C5AX1okGEGBhv7x
	z03l7yNTDfEqfabbUThmYh7ziwSdv+dHzfbBTCqMjCdN0IUQsXF8lcTemQ4Ui7R6NyONx3KjEaP
	2YR2P0jSCXdN3lr01IB+nGf68rDIzuP9Di10XoOKCgbrCoT5FZunShde6nZAbHq4WNBFPIzCQcR
	s+G205icI7u69IwFR9YC4e64=
X-Received: by 2002:a05:6512:31d6:b0:5a1:4712:376a with SMTP id
 2adb3069b0e04-5a33759184amr467862e87.8.1775210832087; Fri, 03 Apr 2026
 03:07:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331205849.498295-1-ojeda@kernel.org>
In-Reply-To: <20260331205849.498295-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 3 Apr 2026 12:06:56 +0200
X-Gm-Features: AQROBzBBW7rQ85ZJif0nroczUc04Z6h0dVRy0ZiPuatyp9TJcZiZGUSTP9K1ZwE
Message-ID: <CANiq72=-vxjqPPiAPrN8Oxcs8ExhHY2qvhN_Qd5JnxGGKEOOcw@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: rust: allow `clippy::uninlined_format_args`
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	Aaron Tomlin <atomlin@atomlin.com>, linux-modules@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [7.34 / 15.00];
	URIBL_BLACK(7.50)[rust-lang.github.io:url];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12631-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	R_DKIM_ALLOW(0.00)[gmail.com:s=20251104];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,body];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[kernel.org,suse.com,google.com,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,atomlin.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	R_SPF_ALLOW(0.00)[+ip4:172.232.135.74:c];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=2];
	NEURAL_SPAM(0.00)[0.989];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,rust-lang.github.io:url,mail.gmail.com:mid]
X-Rspamd-Queue-Id: B11F639332C
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

On Tue, Mar 31, 2026 at 10:59=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wr=
ote:
>
> Clippy in Rust 1.88.0 (only) reports [1]:
>
>     warning: variables can be used directly in the `format!` string
>        --> rust/macros/module.rs:112:23
>         |
>     112 |         let content =3D format!("{param}:{content}", param =3D =
param, content =3D content);
>         |                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^
>         |
>         =3D help: for further information visit https://rust-lang.github.=
io/rust-clippy/master/index.html#uninlined_format_args
>         =3D note: `-W clippy::uninlined-format-args` implied by `-W clipp=
y::all`
>         =3D help: to override `-W clippy::all` add `#[allow(clippy::uninl=
ined_format_args)]`
>     help: change this to
>         |
>     112 -         let content =3D format!("{param}:{content}", param =3D =
param, content =3D content);
>     112 +         let content =3D format!("{param}:{content}");
>
>     warning: variables can be used directly in the `format!` string
>        --> rust/macros/module.rs:198:14
>         |
>     198 |         t =3D> panic!("Unsupported parameter type {}", t),
>         |              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>         |
>         =3D help: for further information visit https://rust-lang.github.=
io/rust-clippy/master/index.html#uninlined_format_args
>         =3D note: `-W clippy::uninlined-format-args` implied by `-W clipp=
y::all`
>         =3D help: to override `-W clippy::all` add `#[allow(clippy::uninl=
ined_format_args)]`
>     help: change this to
>         |
>     198 -         t =3D> panic!("Unsupported parameter type {}", t),
>     198 +         t =3D> panic!("Unsupported parameter type {t}"),
>         |
>
> The reason it only triggers in that version is that the lint was moved
> from `pedantic` to `style` in Rust 1.88.0 and then back to `pedantic`
> in Rust 1.89.0 [2][3].
>
> In the first case, the suggestion is fair and a pure simplification, thus
> we will clean it up separately.
>
> To keep the behavior the same across all versions, and since the lint
> does not work for all macros (e.g. custom ones like `pr_info!`), disable
> it globally.
>
> Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is pinned i=
n older LTSs).
> Link: https://lore.kernel.org/rust-for-linux/CANiq72=3DdrAtf3y_DZ-2o4jb6A=
z9J3Yj4QYwWnbRui4sm4AJD3Q@mail.gmail.com/ [1]
> Link: https://github.com/rust-lang/rust-clippy/pull/15287 [2]
> Link: https://github.com/rust-lang/rust-clippy/issues/15151 [3]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied series to `rust-next` -- thanks everyone!

(If wanted by modules, I can drop the top commit.)

Cheers,
Miguel

