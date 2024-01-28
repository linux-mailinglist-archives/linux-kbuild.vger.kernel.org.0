Return-Path: <linux-kbuild+bounces-695-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 458FB83F2D0
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jan 2024 03:12:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DDB2C1F222C1
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jan 2024 02:12:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CF89137E;
	Sun, 28 Jan 2024 02:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AxcOKA/k"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC2815A7
	for <linux-kbuild@vger.kernel.org>; Sun, 28 Jan 2024 02:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706407931; cv=none; b=EQQdrYiuf8YJJDYiIB04FEXpO10uEIrZSN45FoRaxcI+gP+qjKu1OfUSumJv5dpsirwm0LuVb8j02es5KvPiejjKQ6fNF36mpYHt0Sa+85eGQ6e9EeKmBjligxljq8H1EJANqnvAe8iax8OUdpFeioMqgoMS4qKUIVxRP4a6QH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706407931; c=relaxed/simple;
	bh=d3e05kDxBdB8NHp40lyniSHEoWAmMJYUj5HvpryjTPg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K/IZaRH16dtbUQVVzpHzb6kvCgu/mqjorzShyqQkWiLXDd0CWi4jVI+cpxc8HWvnzNWwvOh3//ByyW31qOm8r0VnsaVuEE8nRyb9ASQZOrGMuYgFzsrdOwik/m8p/TptNFphVfvdYF/u2qBAJ7ZwzNR4oiFjlL4NaN0HtynfGtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AxcOKA/k; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dc227feab99so1537042276.2
        for <linux-kbuild@vger.kernel.org>; Sat, 27 Jan 2024 18:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706407929; x=1707012729; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d3e05kDxBdB8NHp40lyniSHEoWAmMJYUj5HvpryjTPg=;
        b=AxcOKA/kdFPaYgtudFsC9DdiAtctIA/o7Aouhj48jGazglksIXXldH6WfdQ1V2ocBD
         eZxiNIlnfpVhWHOkYHdfmNKwdXvtXYSytbpbpB/nbifPT+BFFxfOz5ryd6zKG/S8BXQC
         VjIBTs6HDNH8aeq03YKkLd9k7QTo3nNqPAu71f0oBBH2JJmYNzFY4z8dIFwWxtzRJ7d9
         PazPPZfhNUaK6e0LJqwgUP+5noCyyiRNJ3HmX/J8GR7EMFrVW2IW/A87SM8HZxNL7rjr
         AM85in+SqdlnyZoFYATrixYnaKZCetMM14DqZqNb+R7ytrlSzaZ7Gh3a2Li6VEFEUG/+
         RhMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706407929; x=1707012729;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d3e05kDxBdB8NHp40lyniSHEoWAmMJYUj5HvpryjTPg=;
        b=LSo5mPx8RUCy3YyNwvWsEYZByMt0w87gqIhblUPPShzmj7bMIZiw174sL4Crm/LJmO
         8LeDRwfb7EZyu9en6VQPbScPK2msM8csvsOBPF4P0UVwthSu7986pb6sj74//zH0dmnO
         7H0QO12+5D9FBUQ/jhxuIUb+q71sodw2+wn88E8GX5jb0zjpsNdManf+9wnJlKIGOQjq
         Xt2aplLxVzQGgx46sIugKuyDNSSWC2+pYtV5++5XZo4ZVlCSCrUqO4R9yEjSDqAoDSXM
         OKG6TUmU9zREIkENHD78Bnq8ll4WLL9XKZV+aSPMR4q2Glf+gY10/6cbfly3ZAGlgM5w
         H01A==
X-Gm-Message-State: AOJu0YxcxVYIdpp4hnWd7Fn28U1G7TXZ1sfjMXzI/K4dHPvby3HjCOXu
	yl/JM5lb6LDaBhitZM8PJo8yDaPdRajZO6bM7zn3IJKIhggDMrX3nXrg1M6HU7r6jIwIzKPgE97
	uOwNBKQgDsmiCfMUQuGQ7/N/2o88=
X-Google-Smtp-Source: AGHT+IGv/x+ExywEkARR+B/joraBprTXZhQSxa654VqDnjeq1i6WOQ+Lz16b5fHJpbEkeP/wpSd392M9KrurzZsEjuM=
X-Received: by 2002:a05:690c:c86:b0:5e7:6124:805d with SMTP id
 cm6-20020a05690c0c8600b005e76124805dmr2764338ywb.66.1706407928866; Sat, 27
 Jan 2024 18:12:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAG+Z0CttsBe0_OoPeU3bVh9dg9DN_cUwcX2oC0Mj2uNxurehWA@mail.gmail.com>
In-Reply-To: <CAG+Z0CttsBe0_OoPeU3bVh9dg9DN_cUwcX2oC0Mj2uNxurehWA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 28 Jan 2024 03:11:57 +0100
Message-ID: <CANiq72k194yhmi4Gu1CecsBBa8xMDFBPAooF_RNHi+Xfc0vRJQ@mail.gmail.com>
Subject: Re: kbuild: Port build system to the future versions of gnu make.
To: Dmitry Goncharov <dgoncharov@users.sf.net>
Cc: linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
	Martin Dorey <martin.dorey@hitachivantara.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 27, 2024 at 11:15=E2=80=AFPM Dmitry Goncharov
<dgoncharov@users.sf.net> wrote:
>
> Port build system to the future (post make-4.4.1) versions of gnu make.

Thanks for the heads up!

> This patch replaces tabs followed by conditionals with 8 spaces.
> In case the mailer program messes up the tabs and spaces in the diff,
> i enclosed the same patch in the attachment.

Yeah, it is mangled, and the commit message needs some refactoring to
separate the non-commit bits like this paragraph, but the contents in
the attached diff are what I would expect (I did the changes on my
side grepping for `ifeq`/`ifneq`/`else` and they match yours). So for
the contents themselves:

Reviewed-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel

