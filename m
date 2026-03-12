Return-Path: <linux-kbuild+bounces-11891-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GA9pKffJsmmvPAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11891-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Mar 2026 15:13:11 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C2837273215
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Mar 2026 15:13:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 98B0F30069BE
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Mar 2026 14:13:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6470834D4CB;
	Thu, 12 Mar 2026 14:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sojfnhlo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FEE035F188
	for <linux-kbuild@vger.kernel.org>; Thu, 12 Mar 2026 14:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773324779; cv=pass; b=uMCEcHkjipAu/VsG3oLU3lcXzBNlpUQFPFhCcnxuCI3Orm7WLssAowviUop9W5PzmDMW0dYOykCWH8dbeKckh28QvI5mq8bB+vfHVf/Lk9VYvOn9jFKTtNjSR0bCBw5cKuyP6papWkhmIZQb3BSNHdkLrVQL6IGVZYDCXIO+TIY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773324779; c=relaxed/simple;
	bh=crp4nXRTSnQxu5DrXrn4okeAwkLZ7jy6iVWODJy4Gjg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hnx6jRj4qaATAzRF0ilWadv1oMXVZA+isWLq9ZFgL7xVcZh+r7sfXnAIVfqzGQFL3PwiPX6sicTrJ29OhaHJmxOhdzLH7puf2Uy8JadBOOURaCfhmFvFKvAyXCHebKAV/3XNpB4dG5ecZX5mXDRA7epgbEcYRJ/r3dug7XRxnEk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sojfnhlo; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2bda3b4318dso68200eec.1
        for <linux-kbuild@vger.kernel.org>; Thu, 12 Mar 2026 07:12:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773324776; cv=none;
        d=google.com; s=arc-20240605;
        b=fCF7fwMvMMSOku70qe0xbNdEYgdeucxI5Cflko/1823ddkryamFy7qcgSbIra1Apck
         pZxRuYGwMrb2lPKMi5LhbBEY7v79351NyR7ZbCvEmErqikJdR6ZIVLKR4IqCoH5c5hZc
         SCqSa6t49wf2YdMN1EyGxqojdwJ+O/ss3tdaaJc3MQwL+7sEGe+KaK3T61om2GWTBe58
         4w6e4iKTum76WGA2LBINYkVeen7LXQYaMDAJpcahabmMH9aMhmY+4wKOfBSnHJrJnJee
         N25kNNINCbzNwmqyl8Gqy1URCY3T9p28jrNXxu+e1EdPyYqb0/eXzCfbPEknidAzuW3y
         OfVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6eOWrX69/YZe4aFBkH+waBiPUXBOMXCfZ8Ty7gGvlRg=;
        fh=2wXDC+ueJaeZzZ7kvg4syODLpHDs/SmV8oI0DhJjtP8=;
        b=cwCBlj1ANgU4mZD/UgwYoMPuWi8SZ/cpbgWFIgCQ4OznerT1GErePM3Ax5Y2XdgM6J
         xFJP22LIIe0ryF647Rl84DvQ+HxI8/8tDfZa2jy1wjwByZA9qhzTqMvwPYhKnX2kYGjy
         LeQ5byNizWVhmZknpfbJua28jwHt+jlLtxLTQ5gTjxxB5BpPaPmsQwawvYfwxg0Hfyp6
         MzGBrSnnULFGzDdur9klljxKDQJeP2kgw5ZPz/3s3K03ffJtIhCFCUOxXScyOZlAZrjB
         p/gFIVLPOlRFSSWSvoAd91AImxZO5Rv2QRmH6Bm+Eic7axpBfRJr5YODgbquqadiYuKq
         AQdw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773324776; x=1773929576; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6eOWrX69/YZe4aFBkH+waBiPUXBOMXCfZ8Ty7gGvlRg=;
        b=SojfnhlosruICIDHrT34kuOviz5EgoPYCimgfL8Pibf58jQovTKT04SFv8kWWaaqvF
         9L0qrCqSGeM2brfXliScUcPXBiXAS9YKx2MtaMdBftp0yHDxwG9E8ojQiZtDnmNnYhRN
         OHvdfG1zqSl2yRjCiv07Prj7sELdH1bTVRg5Xvm9w63y2Srhosl4wsHPMOn/Jtpra5za
         hL+Tn2MhochJfuWwG6WbBs1+1fK6lQoCSTCK05qbuQpula78nMjvNOB9zmZDwzlPQ85u
         Gl/pOnzxrG+levfU0CjGCKCu81Sfo+zs4Eu1EZxWbxDkmDQz62SZxSDjjWdytcn5IlXq
         3GVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773324776; x=1773929576;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6eOWrX69/YZe4aFBkH+waBiPUXBOMXCfZ8Ty7gGvlRg=;
        b=bSWLdIcdRNEKGjtX9O9mRRrOCi75oMZ6ecw702RsS7V3l1vJAMIHP6if89z4bPQm0B
         X0+Ns39qmdQXgSQxYL7R2rv750WeAJVUTHDU7kzF31I5Vwj/AO1Ik1F24XnYfb50Xg+H
         9JICcAxX7WgA11eV0jkVReJsSjimVkon3Nlk+aflahREZWez87yuodgrkVjk7FG6jp5f
         pJgebMZ9WfTeYMppWtk/LopSEQHVvEoiARAD8BuhqfKp+2py1Ya5XvgeoMe1xoPlegTp
         HGEa0Utxkncd1iBBpQI+HJ3kgCrKnddN7pmtMfd1WjQ93cC7KYvE3V/jr6Z0wGt9Tvat
         MENA==
X-Forwarded-Encrypted: i=1; AJvYcCVo0vq/ZiRGd6RT89EVHW9USAhhwHV4xFu7Rx8xmpMDfToaui0EzubB90sQp8DWBywZoUpJ0WfFl5e7TvA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMu/v5WenbOmHJxhQi6A26WvqXLyYjE5eCvOhtvKpftvWLTUqP
	9IeBr0w/iYKNqMTjNkffcPNn3esE+YmzWVBB1mLqc116gWIGTa9Jh61tF/dlCmzJKnL3LhCxUqk
	UcO8PyfXUrHQhNVguOEEi99X2bpVqxgg=
X-Gm-Gg: ATEYQzzcpi2SRGBthQJS7fewQ1hfSlp1qGXOIx4IJW2UR92JcvEnUBw8LFlFbzL3J/Z
	zBy0X0of+Ih2KDEIG5jOiU/hAUXeZ8swJZhYPnojEdBomBdyk6TQD/o1NLb2y9iVAQuue3TMfGA
	lULsR5/m8oS+xp8EbLSV59Bv/6lwVP/XGhGI/ZGwe0OEMWWY+DAEFCUi2UxnOuz67DBfGlYblon
	VMhcSmPZ47q0BBB6CLVq2yFJZJiqOziucPuflmFmC/QsRsWNmPFwc98BM3ceuiDpGJcnNPsok+D
	Mv5v5qeSLPMLfj/3/aIdlioGsbKHP8HOWD7a951mG4rOyF4VcloUVrhsV1YqBxDmqJc/FmX+ST2
	SV5+0vrjfHxDvF3TlDQUiLRg=
X-Received: by 2002:a05:7301:3d18:b0:2bd:d17c:b0aa with SMTP id
 5a478bee46e88-2be99a92ca7mr517960eec.6.1773324776231; Thu, 12 Mar 2026
 07:12:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203221224.GA2703490@ax162> <20260205131815.2943152-1-mlksvender@gmail.com>
 <20260205131815.2943152-2-mlksvender@gmail.com>
In-Reply-To: <20260205131815.2943152-2-mlksvender@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 12 Mar 2026 15:12:43 +0100
X-Gm-Features: AaiRm51IHWWN5UTrr_5ZnPWocBFehwqVL5SrUFu_N1GxcI2hhpEBsuGv-tlBNm8
Message-ID: <CANiq72nnuKJaKrxrut6+noR13PUiSoWWyyp-pGx-fe_2O6ayFA@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] rust: Makefile: bound rustdoc workaround to
 affected versions
To: HeeSu Kim <mlksvender@gmail.com>
Cc: nathan@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	bjorn3_gh@protonmail.com, boqun@google.com, charmitro@posteo.net, 
	dakr@kernel.org, gary@garyguo.net, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, lossin@kernel.org, nsc@kernel.org, 
	ojeda@kernel.org, rust-for-linux@vger.kernel.org, stable@vger.kernel.org, 
	tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11891-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[kernel.org,google.com,protonmail.com,posteo.net,garyguo.net,vger.kernel.org,umich.edu];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: C2837273215
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Feb 5, 2026 at 5:18=E2=80=AFAM HeeSu Kim <mlksvender@gmail.com> wro=
te:
>
>  # Similarly, for doctests (https://github.com/rust-lang/rust/issues/1464=
65).
>  doctests_modifiers_workaround :=3D $(rustdoc_modifiers_workaround)$(if $=
(call rustc-min-version,109100),$(comma)sanitizer)

So I was merrily going to apply this, but sadly, this is not so
simple: the patch doesn't work because the doctests (the variable
quoted above, no the one that the patch modifies) need to take into
account the other one, which appends the sanitizer case using a comma.

For instance, for Rust 1.94.0, this would expand to just `,sanitizer`.

And it is not as simple as adding the flag there -- please see what I
wrote in commit fad472efab0a ("rust: kbuild: workaround `rustdoc`
doctests modifier bug"):

    By the way, the `-Cunsafe-allow-abi-mismatch` flag overwrites previous
    ones rather than appending, so it needs to be all done in the same flag=
.
    Moreover, unknown modifiers are rejected, and thus we have to gate base=
d
    on the version too.

I would suggest we take the chance to introduce the range version
check, and also to gate the doctests check up to 1.92, since it should
be fixed in that version.

And perhaps it is simpler if we split (expand) the cases explicitly
version by version for each variable using conditionals with the
version check. That is way more verbose, but it is way easier to see
what is going on in each case and to later on remove the cases when we
upgrade etc.:

    ifeq ($(call rustc-version-range,108800,109000),y)
    rustdoc_modifiers_workaround :=3D -Cunsafe-allow-abi-mismatch=3Dfixed-x=
18
    doctests_modifiers_workaround :=3D -Cunsafe-allow-abi-mismatch=3Dfixed-=
x18
    else ifeq ($(call rustc-version-range,109000,109100),y)
    doctests_modifiers_workaround :=3D -Cunsafe-allow-abi-mismatch=3Dfixed-=
x18
    else ifeq ($(call rustc-version-range,109100,109200),y)
    doctests_modifiers_workaround :=3D
-Cunsafe-allow-abi-mismatch=3Dfixed-x18,sanitizer
    endif

Cheers,
Miguel

