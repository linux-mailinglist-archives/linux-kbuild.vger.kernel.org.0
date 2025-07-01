Return-Path: <linux-kbuild+bounces-7817-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 622E6AEFFCB
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Jul 2025 18:28:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B07B3B7EA5
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Jul 2025 16:28:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC78027B519;
	Tue,  1 Jul 2025 16:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J1VXjDeq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B23A27B4FC;
	Tue,  1 Jul 2025 16:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751387256; cv=none; b=dzXSLu4Yqfm+k0ho3DYjjqEshAcILOKqik3+AEpfDTHyJH82DgelNpe5Oznz+gB5iuMlLctflD7A8noi33vVQaiSoIfEk2n+81RWDbQanOXlBfJjRtIR6v+8zXcBgB+GnCwciMyUVYjMoTQZt2MgMZrOOIopxTQkR6JyTUQCYWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751387256; c=relaxed/simple;
	bh=cKjnvNYdXUtU4xsuzC/O/yPbXpoyFkJif6q5RgpXK80=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GdyM8+T4sT5IvzWKwHEGwA6BM30VHOMiOoN7mWrlxSfcATvwxYPiTfPXDuDRyNwv6Y0QLp4coQr5qdeFRWnDOigKAs0TqzeGkBMCyHb/yCXQsVJTAwwUUM2Yo6dvhIlSgO09fjJNOQ/2Bn4hY8RX8xFFZ0C6K3PEqK6cNqJKAeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J1VXjDeq; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b31c9d96bcbso744332a12.3;
        Tue, 01 Jul 2025 09:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751387254; x=1751992054; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cKjnvNYdXUtU4xsuzC/O/yPbXpoyFkJif6q5RgpXK80=;
        b=J1VXjDeqaZQNOVzJWYgrR5Ox+QxQ+B3dRxBAOveC/B5uQ8JVfSpTdQMxb5bxtb+hzO
         9Ra8IjjzW92+Ya1N9z2SYUdlMvSh6aB2s/lTXecO4JOxtXixX4K2lJcK9xBQE6fGR4yp
         DBDJ9B4w6S6HP6o+1TI3xpJ40yHX5oSYKFDMiI8zzJp33rvII4xjJdJAM1pXWFmNo6vI
         8/TfViFHXYoBvgN3b5qGap75iJ+s6hcxS4VnRWDUMj7VNT7UFRUfZZpkl06S09tvLftf
         2dm9cq0PADnwrNuJrLi1PpF/sNy4DzQjZfrMd9JoQJa3jiqdaCJqgwKGnJ9EJ3Ok377x
         5p0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751387254; x=1751992054;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cKjnvNYdXUtU4xsuzC/O/yPbXpoyFkJif6q5RgpXK80=;
        b=BPh1gOlkOo/Bhrh+LxmeitqfWf9AFD1PyPYqF4bg32WKODWIPSU4hjqQkfsA2lKDG/
         yG6V+Sj6JRutae25dlkPuB4jz27uLG0EcA7qC6cd8wjGWnGiWRDgijVq9mRIaiIV1xRO
         vWaBNb1KB6Gvds+NK2RktBHPD0kj5+44ubVd9AmLhfzR9p48ykZ5GPVLBa2Ahu5NeYbz
         9c0mVXsXdY/Kr0giGAqv2//PQ9IYI2Ep7XsV7jBrO7HujSOGigiPY9VO3bG6chzAtVai
         IG59n5hrlYG4U5MRLyCqUXeVcjlZrub+0sbUxeVH03dbl1b2yrCrWZ8+yFvYOFTKasOh
         BPoA==
X-Forwarded-Encrypted: i=1; AJvYcCW2f8RUpHVFSY5PUPdSzgRBqOetGHAFxzPjSuAPMPfuN3QRFfbuBnIfKnNE6EC958upDzx4AYaumOoHz08=@vger.kernel.org, AJvYcCWESL0kbtDUC5E44A41hWoMYSZYtUi+vyJyHiYgU+phXsxX31/IzNUeuAtrZ1nz9sNUmW7IP5/t3+almGYkOw==@vger.kernel.org, AJvYcCXILPz4g0CieDgp52VRB+hAwOljpjs7CiW5RVLmy9zudvoiYqzTxxs26iGYKhdH89AClb60AfBINTkv4Ksy@vger.kernel.org, AJvYcCXbfDVi+tcz4wZj2pI9wzqxRThWr/+BY2OKPorcTKT/cUgPLPQCAhSwFeNH16dTJf84RDwAdKNmiSRKeya9FnY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIQwqwM90trwrS/hoJpTe0WuZKyQETz1pIC08bq2AsFZCeQt6t
	0qzP7uKeV+ohgQnIJXWQnylABOhpgNPAX2lymJm+8uDgymFXz5hE+AtSd/AFWYf/Rm5iR7YEQLK
	sJHdbDklx4JJe1gLBDrOe3VohUoyO/BU=
X-Gm-Gg: ASbGncuOxuH9B/oL0Q4dVJ77lAakU0GlDUWxvkYwzbG6oEd2VUKOvs3rJuvik7k1eTr
	FxCNbFFFgOB6uxqU/LVCQ2XGsKVdu2+9TcN791iykxWLhuAqWBkOlX6atSJaWAa/kPgd+7nJKWB
	CU5sJp2IbPECu+BZdcDa8/f9WpM5A8ERypwSNsqXXPX1Y=
X-Google-Smtp-Source: AGHT+IGyD90mrtIwflgMbVjW9OHseBOqyeZ7mkyz0iOzcZtgRqM8RHdH6rWzGOaOZb/HfAv5sN+D5yHjiOrAL0dvkWM=
X-Received: by 2002:a17:90b:4f49:b0:313:f9fc:7214 with SMTP id
 98e67ed59e1d1-31951965582mr2297818a91.1.1751387254254; Tue, 01 Jul 2025
 09:27:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250612-module-params-v3-v13-0-bc219cd1a3f8@kernel.org>
 <DARCZYNPIJVZ.3JJSZ6PSAEMEC@kernel.org> <877c126bce.fsf@kernel.org>
 <Mg1_h6lRpg9tdi0VjiyDfIEy2juzgDWxOhYX61qSUfyEpeMMksWW1e-blTka_G1dXUvpZVktdD-zL3X1a6T6Cg==@protonmail.internalid>
 <DATW0XWNN45X.1L2WMZ41JJ5O8@kernel.org> <87v7om4jhq.fsf@kernel.org>
 <RPPvXQKnjK77Kp9mKaiFxbNj1fTHKb_I7_nbY81fZop-Wz8n5TTi4_lpXP9U9AwjocvZKqJPI8PGKufJn9cIzQ==@protonmail.internalid>
 <DAU0J3T0IEVM.2K7ZRQOVOHF8H@kernel.org> <878qlh4aj1.fsf@kernel.org>
 <87plepzke5.fsf@kernel.org> <xFouVLxX1_t1mH69FDYwlIhBlI72M0IzQEKn0ntG_wT9z7V5DtbxiwVP_frH_yiS-Gf0q_AhqetbLmuvJ_yP5Q==@protonmail.internalid>
 <DAX65TRN0TGP.25VZ9DYV86XWY@kernel.org> <87wm8txysl.fsf@kernel.org>
 <9G3W1seaM7elcwWXaeoaa2nfpFYCf-AmBdvZhACGP13KGUtTPVMwGNYdTQsdtp8ru7GIP3-UYTzXscC1MRUKrg==@protonmail.internalid>
 <DAZV8OGL8BMH.11SLXBXQ17ZJ9@kernel.org> <87h5zxxtdw.fsf@kernel.org>
 <H78pT7YnQEhAXdxzl_hhnGVUiQuFpibB21_bjH658fMz_5JYbwsPLYYVh8u1gYnzK3N3ilTEAvqOpkuptVx3rg==@protonmail.internalid>
 <DB03MZI2FCOW.2JBFL3TY38FK@kernel.org> <87bjq4xpv7.fsf@kernel.org>
 <ffROWpeKczrWSBlKYov2atJG-QD5l5fUOb2dVCNkWlcT9h6DJpa4joGQpjqtYyLP7HX227fCAayyDQunZ464XQ==@protonmail.internalid>
 <DB0LKI8BO3HZ.3FF03JN4364RM@kernel.org> <87zfdovvz4.fsf@kernel.org> <DB0U12HAEVZ6.JKFPI2UQHDRY@kernel.org>
In-Reply-To: <DB0U12HAEVZ6.JKFPI2UQHDRY@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 1 Jul 2025 18:27:21 +0200
X-Gm-Features: Ac12FXwGokU26ku6MNjpG2T2im_ml-gRqu_GdFwFKfo05_BR1hAAvDHeKXa2Hck
Message-ID: <CANiq72kFUSFgBv7Es3Mhe4HUaSPZk0EVW=JaMdaAGHsQOxYN6w@mail.gmail.com>
Subject: Re: [PATCH v13 2/6] rust: introduce module_param module
To: Benno Lossin <lossin@kernel.org>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Alice Ryhl <aliceryhl@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Trevor Gross <tmgross@umich.edu>, Adam Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
	Greg KH <gregkh@linuxfoundation.org>, Fiona Behrens <me@kloenk.dev>, 
	Daniel Almeida <daniel.almeida@collabora.com>, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 5:43=E2=80=AFPM Benno Lossin <lossin@kernel.org> wro=
te:
>
> Ultimately this is something for Miguel to decide.

Only if you all cannot get to an agreement ;)

If Andreas wants to have it already added, then I would say just mark
it `unsafe` as Benno recommends (possibly with an overbearing
precondition), given it has proven subtle/forgettable enough and that,
if I understand correctly, it would actually become unsafe if someone
"just" added "reasonably-looking code" elsewhere.

That way we have an incentive to make it safe later on and, more
importantly, to think again about it when such a patch lands,
justifying it properly. And it could plausibly protect out-of-tree
users, too.

This is all assuming that we will not have many users of this added
right away (in a cycle or two), i.e. assuming it will be easy to
change callers later on (if only to remove the `unsafe {}`).

Cheers,
Miguel

