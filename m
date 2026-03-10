Return-Path: <linux-kbuild+bounces-11795-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOIBJ2dtsGmNjAIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11795-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 20:13:43 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE5C256EB7
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 20:13:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3558A3078A2F
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 19:13:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C5C43B4EB9;
	Tue, 10 Mar 2026 19:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YCX6aZ6w"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3ACA2D1F44
	for <linux-kbuild@vger.kernel.org>; Tue, 10 Mar 2026 19:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773170015; cv=pass; b=JIFww/EegWo+JVk4iDZwt591cCqCcY4LMrUI/75EsBeeDEOfyFlvVyG36eRi0j8kbNY9X+8foxh3IN9rMoA69qLNSpUffwxrKXHEOi6sFXlYEvLcl5c+66g+LaQjbVtAVIDXJVKujod3edU71wdA6TLQKLVIYKHTmvOYbbRDG2A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773170015; c=relaxed/simple;
	bh=ELjFNUMy8+s7K5MZsIwaa5SHuun4uAi5d7KQ2v+LWf0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HGG8EYfU0WW60JUc91Y/KE3fh0YY7ID33Oh0wjcMnlpFDhfU/fF6o1GE2YlItsoAHE1SfEz5o9qYWXn5sOWr9wJiNg1Kk9ZZIiMt9rFgFHsmkga74iFsv0hlpXC2gK26Of9wAhmhd8A263a33Tw6E8IdvnttfY/yP8zBQePE2Kc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YCX6aZ6w; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2be2425ad18so461048eec.0
        for <linux-kbuild@vger.kernel.org>; Tue, 10 Mar 2026 12:13:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773170013; cv=none;
        d=google.com; s=arc-20240605;
        b=g7hnAX3ZZr1JQCn44djJnDoHTUEl1p0CsiPcXcLnxWGE8orUvF1MTuSyI92/Fu/EFH
         0esycZufQV4EmpAjPw3yfwap4jtQsRbRBPGRA2CIinf617YoygATotbYp1Fz+zQT9hWk
         8krcisZQX64r1+iX0hl6xPGcq7+SIxCgYYFnn/idPDaCzunf9YtoGj+rLBj1lewvIBgV
         WEuLJ55sHf5YaxZZWSr6gkMSj1q86c2BJSslnreZ2/zGLBPttjpn1GTi/hVaHSra6dd1
         XA0qhBGUdExXgdFl3YFukIVzAZiiWO77DM0gRUO80R+24jz35cLIOQ0I3wcc6vQBjACp
         FMew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ELjFNUMy8+s7K5MZsIwaa5SHuun4uAi5d7KQ2v+LWf0=;
        fh=VSO3ndAYyRDl7AO/rAYUdznMTKRMp7u4HU6WUjoiQ8U=;
        b=KRI0qQsmeBQKclOGnGgE0rRPpaLsIasfO3mh6SBttJ2+NI3hnb1rYln8gFpIMpydsX
         d43as9BDAOv91LfSJZirzcLdRSOMYIEVEAwpXdtzCx1QFyXLtWwdmegMCIbV4Pp/esPO
         e0zmT9TQjDl6WLhr/lUWTHXUrcNeBSM2orfu3ycPtYd0GIG9wod+qkO6f5Hpqwghh5DC
         P6lTlOP41h2yp1VopWGaotRORtbbfMF9eyyJYObwbSIN61gBwIBjagi2YmZddHH428mr
         9yv3suFE7enOA/EvukYZxZ3L2OC/B6K5YphCbKZKdkIBhynucmCG7x/It2vUv3t9+PgV
         vrCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773170013; x=1773774813; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ELjFNUMy8+s7K5MZsIwaa5SHuun4uAi5d7KQ2v+LWf0=;
        b=YCX6aZ6wA6p49wTesWmY9opPIlNItf9f8/I8rgOdgMTKbjwCJvHWlySKhpnqb9BOU0
         cTJYi2eKA1Yo/74z/TteUmDb5w+XHiIu7BZvd5zMXWgi9Rhfv319g7VQIeFkqjpXsnNZ
         mqsoGx66ft4oiQGhGvcXZiCK/w5Lck6YlV1KzgzF8/sdI37xDzHVwoSHBgmYF35KRycA
         4Q/Plocry9dMo9oiVRQAJKDj/iIv5vFFsvWribvT86F7FMThtJbWPTaFkT4/VrAiA2FB
         bWGd89NzTPDYEC1IyZlJegX4V/r9lzDB4DJHhSxQ8qYlYCiiqrjWSL4nUpPFAuzZDB0i
         5hUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773170013; x=1773774813;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ELjFNUMy8+s7K5MZsIwaa5SHuun4uAi5d7KQ2v+LWf0=;
        b=f6CjqEpguvVKx98teaRvqulIuXniuOoXWcHbv8lnimQbFR1smVK90kqkVftD5uQJwm
         eSHbP21glmSdLYvmUmJrW9lJR1OPhoE93ezStQbySHVbMYe7O8cnGLLHTaqvt9qukfpQ
         ISFUO617FuZWoGdbajwt5P6UM3sP2RLJb/fhnhEpyMomkUF2m74ForlAdJGfTIipqCzG
         xBl0cky9720QG7OiJ4O+Qx9f5bOwA4Jj3DEQpqTIr3P6h8DYLLAsJ71YbzPyYlcnM8Hc
         dDvQKrudYEmx+7cGHDRu1im5OfQudT+S88lAtpr9SGzm/jwTtT0QO+1I9Vumc/+xgb/S
         KTLg==
X-Forwarded-Encrypted: i=1; AJvYcCU5BEkir+4VStne/fwsoIvMosC2HCMamN4KCTiAq9AsIpnh1wsfZEPlGcFlWZRnwuMcSAwVqw/r8HWHuh8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/inQI6KHhelOp7RbFfO2nJkLs/YJKxgMi9ZNaMjUlQTGDnFSh
	Rm65zNmnkWXUzvEeYWd5OiExEG+n73IYk1DFLnak5CKPEKXAoImDK737AepXAawYyig6HgBk0+X
	7fsD/Vlv6eWR1oTyRfCumMuDV6XltheE=
X-Gm-Gg: ATEYQzwVi7c3gwjmmFtDl7guWjJ8qXxtoGkc7BLygq87X2GitrM6/d8PbjrUIPvGEax
	STGn/bD3+lLl4DCTVFjj0R7iNwIWZITjQW3GtMCTefT6sXRMqhRYITkt8yIjqfhlnYtwepwVfjE
	KwDSi3gWDYWCAcMxcezgf4lGpyGIse4GTk+qwwm4FiO5Req9PwNX3E473dOUe68TUxO1wkV+irm
	eSVLfTe9gqgXMSNA0ApjjD+O3I9Zc8b0fhOnFz7VGWlRjMebCv5QGNl2POQt+kn4NEPoXt8qek/
	QPvn7w8/VMpKMGPTr5BHXlnH8OtBeYHAIv1ykMaWTqtzzfjwmr+IsxIYZD1u3VPqMQ2JDfAnY09
	gh4GsAPbPW67r3dVcFXCG/wQ=
X-Received: by 2002:a05:7301:fa13:b0:2be:80c4:2c60 with SMTP id
 5a478bee46e88-2be80c43508mr633066eec.8.1773170013040; Tue, 10 Mar 2026
 12:13:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310-binder-crate-name-v2-0-0f7c97900d36@google.com>
 <20260310-binder-crate-name-v2-1-0f7c97900d36@google.com> <abAzTFLYsUxK7VJ6@google.com>
 <177315751568.96522.7020199079773666163@1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa>
In-Reply-To: <177315751568.96522.7020199079773666163@1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Mar 2026 20:13:19 +0100
X-Gm-Features: AaiRm53DDGVgL5CoTpBeNVWwk6s_QxgxPeVBI4q2KZlUk1l4wOd7Dh6PfVBh49Y
Message-ID: <CANiq72nM6ECBE+iiKrBRzCwOyd7BtQ4w6o9AH4+o5rcrcY30kQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rust: support overriding crate_name
To: Tamir Duberstein <tamird@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Jesung Yang <y.j3ms.n@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 1BE5C256EB7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11795-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[google.com,kernel.org,garyguo.net,protonmail.com,umich.edu,gmail.com,linuxfoundation.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 4:45=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> Did you want me to take this part through rust-analyzer-next? There's a
> significant rewrite there that adds type annotations to this file, so it
> would be better if this patch could apply on top (with annotations).

We should ideally avoid breaking it between commits, so we could apply
it after I merge your future PR, with your Acked-by. Another way is
next cycle, through rust-analyzer-next.

Cheers,
Miguel

