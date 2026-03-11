Return-Path: <linux-kbuild+bounces-11865-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OouJhF2sWnovQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11865-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Mar 2026 15:02:57 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF079264FC5
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Mar 2026 15:02:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A7152301F1B6
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Mar 2026 14:02:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E2F136492D;
	Wed, 11 Mar 2026 14:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bYUcmuZl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0C230E835
	for <linux-kbuild@vger.kernel.org>; Wed, 11 Mar 2026 14:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773237754; cv=pass; b=uy7+8Xh/24LVvkZi0zlrQlEeheS6YXQWQ6R1hzglLDEPaeI25QeXbkMv898+7rEaZmi0NSCLweekHjvUW/2GyTGtOZGkJX8F1M2CSg9hKYlBmA0uTW9AI7IM3cN9UtIsfvrHfeqy+bpp3hmw18+ke/SlLObax77GyS7JYJ5nY30=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773237754; c=relaxed/simple;
	bh=drCbjRPhf/6CelocQsTKz5RWs/RGtOeSnCRiaw6qCig=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nEv1T5/oe1NgVbQFU5X/yx6WjkPZIF9Gz+k+KOVv+EuTIe2aBkpkUxAA1kiJpHm4iSNeqy2wcuDt+BGe8Nlp06pHPEtA7d4C9Lj47ZdYlnOIqaESQwxEg9NTtum/Tfm0Mg2pEVTNH4OQ/uKW53KlE1/E4igKIrL9jamlwiVLD9E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bYUcmuZl; arc=pass smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-12734af2cdcso56831c88.0
        for <linux-kbuild@vger.kernel.org>; Wed, 11 Mar 2026 07:02:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773237752; cv=none;
        d=google.com; s=arc-20240605;
        b=hAWUGSR+Qzi85A350tQILYcBg5KgqUUSSUpiH2qjhtW/V8IyASPETyOyLRFfWnu4F+
         r6jGKP/iYZIYXfw9sxoOQZwb7Qtzm+j0Xf+yLf7HUYEGl7a7lkdsNTjLb+Ca9dkp9he7
         2EOncpXil26upHHsifemz4WjXXiHka1F4SMvXp2oPOMQweFakmLxy3pDeVdad1j7hV3o
         33R/22nB95ib1hjqW47Kz5UAN7YAC944aAabZnjZ5+JUW5zfZ+sv8AM2Uok/wkgHr53E
         pHVlLgGz0zf0Izg7WOKKe2ucxKhDZcnMVfcxV/mf1DMr7j5HNR7+EfU+AyNXFRtM49fv
         RO0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=drCbjRPhf/6CelocQsTKz5RWs/RGtOeSnCRiaw6qCig=;
        fh=JJiIlzATSDkI+aIouqJ9eexgrB+qqHLEy3xQHVTgrP8=;
        b=iZ+hbp0lolSMs1MlVCuwmZLFFEAkwt/iUdDz7+YHvC5XGnnklnz9IpSmaot2CzsfYG
         +d/DQ2TNQS2uUBr3CiV4ZM4s6B2nyjH4kJXamtryciZ5v2QmCUpmuYwL9p3P9tS+IIBo
         bvopwV22vxk9e8q5djZFaJU2VJWkZAx8J/3nHRynqvqkri9Y6YVdRjRx4TKYzXdqtU/y
         Z6Mp/9JpQJdk9sLdzqtOgILaV2uU1TjYk4qd5X4dNLNGgechTGsz9IKXnQaMCO4wk9bN
         zjniJvJUQRPBXzgVZv9pQXwpOQ/+hONuSL4PwQ42jPZleofLjQ1+XHju6m6l4xwmTS0A
         /zTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773237752; x=1773842552; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=drCbjRPhf/6CelocQsTKz5RWs/RGtOeSnCRiaw6qCig=;
        b=bYUcmuZlt/DNB3EWpS5Eh5l33r1yXvodAwc8r3BJYHH+3GsAIL+ATQwuNNymD6WPn3
         XDTeIC2XeS6uB66YcvA0DmF4rVO/llAct0jR9wZtRpsEeqWw6FHiTJSX5Cz4JrxAvoph
         fd5himp4vt8mQinkR/unNwDsTm4aWfJfM7YbUlw4Ly5+0B7LiUlxzE2WES9ux2UIwNEb
         l1Z9H87kQma7C9Ep32qOnOsz+evv4QAcsVq4veo53OqmRfWqEmUtbyia6tWvqF78IWpy
         nT1abff/AFz/QPHc3tj5UGWcIsv27tVXhuJmiZjkcvfHZ+OGKzjtnfdOM128cOZV5oZR
         Bcuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773237752; x=1773842552;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=drCbjRPhf/6CelocQsTKz5RWs/RGtOeSnCRiaw6qCig=;
        b=TzV20aGclBOf/rrLbwk2/1GRPJlROfZ1QrqPfXnEKCafAPkKk8/lcOQZYJIX0XOTgz
         u4A1DU1WAXX0CPk0bPlbKI/PnCnGockEizPtTCKGsaA5ujKPn9hXR3+6TKt5Nje7A52t
         43Gc3N9tI+TLSGhCTEfHl9DQhhR0+0QCRB2+SBvKtSwfaDWgOBAJyqNjZjPbvUzeeza2
         70huLwPMSYGl4FBkJz62Du7jzhHzfGyD17NmSIyOQz2LmERtpOS8196e/XZaqU7YQeOB
         HQQmF/y06Vnn83FHuv6lTRXtmzadPFC319Z5jKInGj5YoA4u8y12SJWewFC2t9g5yeVX
         T1HQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaAMLN33mo3JceqFOzLV+IXnmvu6I/V8a30CVKl8DoijjCpTb0sLo1VZ/U8BTkeL4zml6fYtJ4u77BDXc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHUJ4c89NITceBKsiUv9+vtrjMwsStWyNHQmzBIF4GjSBJWGd4
	1whwt4Kurw4GVQkYJV6qU7X5fqbv+V7qwYJHWHSUevIckmbrwgVuJPFYn3tK2QIkOUjL6p9t1D/
	QTc18CFNcFkQHfhDTI0PFg12L9k492Dc=
X-Gm-Gg: ATEYQzzIasRIzwJwEaZy7GCGtxvPxASfx5Eyw6r+ATagYRFtcI2JhsxicAhUrK4du4b
	3G2eRXYQaKwLywhXm8hqunrnEG7MJQ4s7kp5Svd5XANn+3kzCiS3FS4VcZra6jo9Z5y0Q8lTba3
	Qc8Ul3ttmnLjHsiDIyDELcoMYOYb7Lxz64WUVfQxtJmlaXf0BEXWwf9Gm8+R6ij+Uh2xYi/AUNJ
	JKTIMC6G0m6zxOj14Sv9Nb66fwcii4AaW4doptswaJWbq6D1Y7+k7yQSdhfjl/B9kDGnrcNLnJI
	0aUg7f4gGnhboG1mbIyU1RZn/5418RQ15RcQ5zJiAlzWGw0WJEuLBXSTMs9LIfKFKaEjJLFZMi+
	+IEPWTGQGBVfJ+CZLo+tfiGg=
X-Received: by 2002:a05:7300:ac83:b0:2be:171c:2177 with SMTP id
 5a478bee46e88-2be8a59452emr542075eec.7.1773237751873; Wed, 11 Mar 2026
 07:02:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225102819.16553-1-mo@sdhn.cc> <20260227132713.23106-1-mo@sdhn.cc>
 <CANiq72krbKir91s-sVLt4v9k9qV8PQTLrH2uhMdByb882CXZ8w@mail.gmail.com> <v6fyrivdraa2rgqhe2jqwmow4tgqczk5e2pzlarmcwjxhai6e7@knw7nv7jtbgi>
In-Reply-To: <v6fyrivdraa2rgqhe2jqwmow4tgqczk5e2pzlarmcwjxhai6e7@knw7nv7jtbgi>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 11 Mar 2026 15:02:19 +0100
X-Gm-Features: AaiRm5213LFNhUR_ITAVrvQlRmSySXl1cxIRnu7jWXwa5ApQMRmklpGKJ3AbURQ
Message-ID: <CANiq72=rQ=X1hhT_NWP-W4r6Nb_Ko9ZfhkL-pbu=9cwxvN1zEg@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: host: use single executable for rustc -C linker
To: Mohamad Alsadhan <mo@sdhn.cc>
Cc: nathan@kernel.org, nsc@kernel.org, ojeda@kernel.org, gary@garyguo.net, 
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: EF079264FC5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-11865-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[7];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,sdhn.cc:email]
X-Rspamd-Action: no action

On Wed, Mar 11, 2026 at 10:35=E2=80=AFAM Mohamad Alsadhan <mo@sdhn.cc> wrot=
e:
>
> I was trying to take Gary's comments about unexpected/surprising behaviou=
r into
> account without adding too much complexity (e.g. new script file and mang=
ling
> commands as env vars) for such an edge case.
>
> Instead if the user wants to pass some complex command, they get a diagno=
stic
> to tell them what's going on and to pass their own script. I felt that wa=
s a
> decent compromise.
>
> However, If the logic is already too involved. Then might as well just go=
 with
> the full proper fix. I can go ahead and do that in V3.

I see what you mean. I guess it depends on how complex v3 would look like.

In other words, if the "full fix" is of similar complexity, then we
probably want to just go for it. If it turns out it is harder than it
sounds like, then the compromise solution may be better.

In any case, I am not sure how much of an edge case it is -- for
instance, `ccache` is mentioned in the Kbuild docs, and some people
likely use it for C and may want to use it with Rust enabled sooner or
later (we ourselves used it for some time a long time ago too). So a
full fix will be wanted sooner or later anyway.

Thanks for detailing why you did v2 the way you did! (by the way, it
is often a good idea to mention it in the changelog or to reply to the
feedback in the previous version if you took another approach to avoid
confusion).

Cheers,
Miguel

