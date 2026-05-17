Return-Path: <linux-kbuild+bounces-13191-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOHkABNgCWqWXQQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13191-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 08:28:35 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF3755F791
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 08:28:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 875013009B0B
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 06:28:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06EE23195F9;
	Sun, 17 May 2026 06:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YGTZQFai"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B24630CD89
	for <linux-kbuild@vger.kernel.org>; Sun, 17 May 2026 06:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778999311; cv=pass; b=EusmUV4glN6keN/LKaFMQCvcC4WfatnXYoYvVzps+CL7P9hrDh9X4rm8eVld5aeKcVgzg8rMFUa/J0gxWotj0bvjKTtsDXueLQNE9RCTQao3UcOGdMcxmhtAcHtz0bHOYxs+P1mcwStO9hxo7RGp0OOB8kxUdyQZ+nxQ1xG0vno=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778999311; c=relaxed/simple;
	bh=OPR2WUH08s75FRHvXlU/rcxu+thbh0/WLa+Aj8Mbla0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZDGk8SynAHJTi7O4HvGYrwFXWCMaaxciuwzjA7SRkNPshJtUhopFKv4tfDeWpaJ5EEwWUV+rmdWc2YUsyrISc0EQSwwpbnG4JEdru1aAtC3yOk3mJfMR5ztmquGxP28DIY6xED5iLUENFXbCOJ6v3x+R9szokrq+WSv8gsU3qfM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YGTZQFai; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2f114d129c0so57602eec.0
        for <linux-kbuild@vger.kernel.org>; Sat, 16 May 2026 23:28:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778999310; cv=none;
        d=google.com; s=arc-20240605;
        b=PCPwLpZf2VpPqmmKbmW8kwUdg9/z2ZOq18pMAEYuhadtwlZ/nKHzUX7onIT+Qmq+4w
         rhRhVMWxo+fv8YrK9iz3ccVv6/Y5HXoxPb5wZxKgjiUeTj45tiAtLM0M5+80DFBCVIBa
         lEYOUpb3cW141zZ86XksC7bTVqoGzN+reTXyKaVtsI355B0dniNYhZwtXuCtijIjY7T1
         5GpfPpfq+bu9pyQdLeOttwmYOmTgL+7dPMpQBgoJnjtFadB+vrH/nTn+8mhmWYdsOeDv
         sTol8hVkQFM0IrGkwIRT6DnWJdUksO9vj5px3aXOhmhPV4lHPpc3FQcymgslNP102Dka
         Dwug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MlGs73OLRAgT31iPjKu3H4aS88H+LsbmLo/DH3+Lxm8=;
        fh=2KlcyZixqtVfgLSuYBA0cY70pTd59H5m8IDUWlOA9Qc=;
        b=N+IQjPQreYGww0IYIn7fgbMTD5le1D9xXOEB3QILPYPmdDwUBztSSY8URl9br/iiBW
         fCguN6/nFhSeSuuI1bJjc923RhqyrUG3O4JNeyYdvW2LTXrarzoUEWrc5Zj2r5hmi90I
         GF1PtXCOViZxNGI4Zqmess4mw86r5ud5ojVeWSSmONWjTQFgNiL5KRU4OH3STe3KPgu1
         qfp+bRHFfLSBfKqmywzm/j/OmL7iNXm1IjjKmEvskSPsObzdhogkdrr5BfEPbOWb6Dv8
         otFBTvRsjY51Lu7i8MeMWWhmVwjLYmhZsiBIXXE11QffI3AxxIhYzGWQ251VVPxz0yvf
         Vdrg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778999310; x=1779604110; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MlGs73OLRAgT31iPjKu3H4aS88H+LsbmLo/DH3+Lxm8=;
        b=YGTZQFaing4oMC2mITA0WdJFvtBI2Hjp6gzlQbUUETLlcDgE4kRB8nZ4B+OXwa9syU
         ZD8kz8CBtDMklZw2LOw4JtCSSPAw9GAqObXSWUV0M9SfGOF6SidYzrX2jr8VNW+rg08+
         2S6aQlt2DQ+LJhX00Z7+hYgI0NInjk0S5l1YN349fL92HCuHdMjWwTtk+nTz3DSy7yO5
         1ZX1LBkh4ROn2jLx2iRDMwLXME4aIIr/iY2+LaEtlr2u0WcpzP2D8o7O8B1b32UMsK3n
         A6sUsqTmY4tzMHqgfiiCwr5AQKRfX2aUGpbUt5Ol9E+MT/ZpHGWYG22Nu7wU67p1ORfo
         INwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778999310; x=1779604110;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MlGs73OLRAgT31iPjKu3H4aS88H+LsbmLo/DH3+Lxm8=;
        b=bfa3pdNnNik8PSl1e7lztlK+h++1NTNa9zjFuSsic/+8WpIty+gnOTq2Wd+XwpRzzo
         hmyTRwb4j4QtiSOi+zKcwSPgJfIxdRCdxS2yu03kgx2N6bdvsxzYJvBlOXb27jvts0XT
         +L7WTJgUc5gw7wOrX+/NS0e49oPnGY+77pbmdDmfq6YoZmaiL3bIO/VKWjc7Dcpalv5v
         +34+9ga1UA4Qt/gUFCHQ61AyaNHIgWOWR1k7b6imJHadGNHCgs5/3LYJTwNYB9GCYQHh
         ugeCBU8WvOSe9e0S/mjqiyDXUjW/7/0rkb9mQUWR7OXdT6zoXGhhbS6MJywX35aqWZIy
         bf3A==
X-Forwarded-Encrypted: i=1; AFNElJ9mSCCDDQY8XlBkkNZHuzSHcJkELol8uDzb9mtm0ZLqKHb4DMUVqn9Cln3oVAAOKAX5dUPMbgmRUW7rIeE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyN4puuEH4OHLvYJ0W9ypRuhtCVeyGBhM7dEyng+TddkVUDRNoS
	xxpF/7PirJ26snjMzGmydOce4V0OcVMf56d2HL3jF9H/hKe/60Rb5o4DCuHUBkJ2iBUNzTQN0ch
	7ABtdq6SXOIduD+tfuiem20/Vrz/hiKU=
X-Gm-Gg: Acq92OHUMRQWvkrxi18zExz4UnbV15Uk3wF/R/TsjjaF6faibyxvCNEKMcbc/pfhjAH
	R6+2klWzJ/h6jOntLAN8PEcm/GrBZmIczU2NtIR3AT/VJx+DvdMXHwp8GUjg6taDYZplyJmkU7J
	pjKUQYgXfnEqiT+ah4ofS4L87jFbgjbSNoVujgJbNAC0zmyUVVXe2M40o19vTF3XyDHTqP0uAc6
	7Gj8axwNdiMXb8QyPqZcl+jswxJGfS2Zy8pF+5Fi6/VQCnVi2yV1uuwaFuEGBEvuX4J3pjcxij3
	V4MhxBdcwE8EB+dybKNmaEB7nbVi79VAOqnTPaRcvEQdt/lVe36lhX0MRovfB5X0tmMC9ZI4LSl
	ElDCcZdtQzE5YGfiI0PTFMS0=
X-Received: by 2002:a05:7301:644b:b0:2d1:9b35:4f03 with SMTP id
 5a478bee46e88-30398652434mr2296228eec.5.1778999309791; Sat, 16 May 2026
 23:28:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260516215354.449807-1-julianbraha@gmail.com> <20260516215354.449807-2-julianbraha@gmail.com>
In-Reply-To: <20260516215354.449807-2-julianbraha@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 17 May 2026 08:28:16 +0200
X-Gm-Features: AVHnY4Ifc1Hb7OMmaBPhAaR2oSj-1JLh4DvcZKwastPdAt-HWTIyTG-2JU6Fszc
Message-ID: <CANiq72kr=tzvEitYj6xyT=jGnKQZK1dmekSU3us7MWGTrv0FNA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/3] scripts: add kconfirm
To: Julian Braha <julianbraha@gmail.com>
Cc: nathan@kernel.org, nsc@kernel.org, jani.nikula@linux.intel.com, 
	akpm@linux-foundation.org, gary@garyguo.net, ljs@kernel.org, arnd@arndb.de, 
	gregkh@linuxfoundation.org, masahiroy@kernel.org, ojeda@kernel.org, 
	corbet@lwn.net, qingfang.deng@linux.dev, yann.prono@telecomnancy.net, 
	demiobenour@gmail.com, ej@inai.de, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 4AF3755F791
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13191-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,linux-foundation.org,garyguo.net,arndb.de,linuxfoundation.org,lwn.net,linux.dev,telecomnancy.net,gmail.com,inai.de,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Sat, May 16, 2026 at 11:54=E2=80=AFPM Julian Braha <julianbraha@gmail.co=
m> wrote:
>
> +CARGO          =3D cargo

Question to Kbuild: would it hurt to hardcore `--offline` here?

If someone within Make actually ever needs Cargo to fetch something,
then they should be very explicit about it (in which case we could
have another variable etc.).

> -                 rust/libpin_init_internal.so rust/libpin_init_internal.=
dylib
> +                 rust/libpin_init_internal.so rust/libpin_init_internal.=
dylib \

Spurious change?

> +$(TARGET):
> +       $(CARGO) run --release --offline -p kconfirm-linux -- --linux-pat=
h $(srctree) --enable-arch $(SRCARCH) $(KCONFIRM_ARGS)

This probably does not work in `O=3D` builds or in cases where the
`srctree` is read-only (please see my other reply on the docs patch).

> +// SPDX-License-Identifier: GPL-2.0-only
> +use crate::AnalysisArgs;

This appears to use a quite different, custom Rust style. If this is
going to be developed in-tree, then we should do our best to follow
the guidelines:

  https://docs.kernel.org/rust/coding-guidelines.html

For instance, a few key points are not followed here:

  - Public items are not documented. When they are, they seem to use
comments instead of actual docs. Markdown is not used either.

  - No examples, doctests or tests.

  - No `// SAFETY` comments for unsafe code.

> +unsafe extern "C" {
> +    fn curl_global_init(flags: c_long) -> CURLcode;
> +
> +    fn curl_easy_init() -> *mut CURL;
> +
> +    fn curl_easy_cleanup(handle: *mut CURL);
> +
> +    fn curl_easy_perform(handle: *mut CURL) -> CURLcode;
> +
> +    fn curl_easy_strerror(code: CURLcode) -> *const c_char;
> +
> +    fn curl_easy_setopt(handle: *mut CURL, option: CURLoption, ...) -> C=
URLcode;
> +
> +    fn curl_easy_getinfo(handle: *mut CURL, info: CURLINFO, ...) -> CURL=
code;
> +}

I like minimizing dependencies, but since we require vendored
dependencies anyway, then it may be simpler to use a common
("standard") Rust dependency for these things. Then we can all agree
on a particular one and use that when the same need arises.

In fact, it seems like FFI here and in the other file is the only
source of `unsafe` code, no? We could perhaps even `forbid` it
otherwise.

If we truly want to minimize dependencies even if we have vendored
ones, then we could call into the `curl` CLI instead, just like we
e.g. call into `bindgen` instead of using its library.

Thanks!

Cheers,
Miguel

