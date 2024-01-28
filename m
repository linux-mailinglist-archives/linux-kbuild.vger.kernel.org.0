Return-Path: <linux-kbuild+bounces-703-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D5783F72F
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jan 2024 17:27:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1374A289A3D
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jan 2024 16:27:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E75C5433CC;
	Sun, 28 Jan 2024 16:13:46 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B9F62A05
	for <linux-kbuild@vger.kernel.org>; Sun, 28 Jan 2024 16:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706458426; cv=none; b=LqbqmAtV7ts1Qh4+CXy+bQoTx/DNDdm4KhDqUWkHgg3imIEgtsyqH9nvlzh6JoX8GdmZmC2Q35TRTN+iU+QKocAJ/2MB0Ng62vI2u6pLJ2X3unhUhJJkXOmXTXoOXSEoMZLmFJZr0rbTLlxrAXqwDLEOGZiFpc/iQ3k5SW63hQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706458426; c=relaxed/simple;
	bh=yYqSxZ0tOEGZRNcOXuUfzYW//ZKQHvjyb6o8GdaB4+E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TO9IgI7QxeyVw2dPyQv13gaj1H4CH8Rf4gCRdy6lOTC/dPYptfXf/AEs6+MSgWVJHQNfqQ3VrwrYZnawVNAwTmR7CLLoV/hr+ntfvHzjbBxbUjN0Ot2nSaZJfiWWelWSTGK3cW33cTHOFhHTjoHO3Po2EB4OkHUw/1WHeD46PFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=users.sf.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=users.sf.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-5d3912c9a83so930917a12.3
        for <linux-kbuild@vger.kernel.org>; Sun, 28 Jan 2024 08:13:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706458425; x=1707063225;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yYqSxZ0tOEGZRNcOXuUfzYW//ZKQHvjyb6o8GdaB4+E=;
        b=E2CJpz5mHdJo2nri33zoG/FkN/iHJ86U4Kg+cDP+IGRO8cAvZiWVSyoV4KkOJhCp6D
         a0rYvKxGj9KZbWRuJzT1A+n8oTReC8EtobZWD3AXvGG9J/LSy6Jcipq7NUVDCqo5k8ma
         YUSEnbm2QZhupG71WDfBSBhb/DMgc1rSrB1zHA+qXUT1+08Kb/m7G9Phtn+E34SYHw7h
         uU58HN1u1Dt/4+i0dP3RtAA3/UJdZN0oSyLXEgwc0jBDb9wK13gQ+mdq/htkurc6a1cE
         moi93XRRZw+CM5XNscH2D3wTtb+LVWPO/mvkKiQ7QguV9DPnis+uYDBIVuXbx91VRfKn
         OCug==
X-Gm-Message-State: AOJu0Yz1IL/TILkXtLOU4RCVAP3BFIOcRqQlq4lCTwhoNbr+Fkj52ub7
	I4xwdp/YeyozycaeoF196htwb7D1V4LRNAGshhTfMz3lwnJQUDIo+2lvAniqtQ3jwOCSXZggrRD
	qzWxCTbqV0VqOB7qLCI1fl2x+tG4=
X-Google-Smtp-Source: AGHT+IGlzMPvu4aupkJDePYQ5msvWBveDE1j6TVnaFuyhRCEiE3e8ZVOwg876LoaCLhP/uNU/27heMn9bT9uZ9LWPZA=
X-Received: by 2002:a05:6a21:2d88:b0:19c:9ac1:4347 with SMTP id
 ty8-20020a056a212d8800b0019c9ac14347mr1190079pzb.34.1706458424722; Sun, 28
 Jan 2024 08:13:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAG+Z0CsTWFxi74PKpCkPjM_-60PsvqS7gkZKs5yrsA8OqL6Hyg@mail.gmail.com>
 <CANiq72k+jEb2kc_LN48959k0u5v5m1qGiJR9tmuUyvUweuXGeQ@mail.gmail.com>
In-Reply-To: <CANiq72k+jEb2kc_LN48959k0u5v5m1qGiJR9tmuUyvUweuXGeQ@mail.gmail.com>
From: Dmitry Goncharov <dgoncharov@users.sf.net>
Date: Sun, 28 Jan 2024 11:13:33 -0500
Message-ID: <CAG+Z0CvndOvQEeNheb+iWURfpc39jMwAFtH+Xzc0AiTjUqN-8g@mail.gmail.com>
Subject: Re: [v2] kbuild: Replace tabs with spaces when followed by conditionals.
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
	Martin Dorey <Martin.Dorey@hitachivantara.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 28, 2024 at 10:29=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Sun, Jan 28, 2024 at 4:10=E2=80=AFPM Dmitry Goncharov
> <dgoncharov@users.sf.net> wrote:
> >
> > Signed-off-by: Dmitry Goncharov <dgoncharov@users.sf.net>
>
> My v1 still applies with the same conditions if the contents didn't chang=
e.

The contents of the patch is the same. I only changed the subject of
the email per Masahiro's request.

regards, Dmitry

