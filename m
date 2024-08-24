Return-Path: <linux-kbuild+bounces-3202-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 814F795DF14
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 Aug 2024 18:45:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F21B9B21D45
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 Aug 2024 16:45:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A46FE17C9B7;
	Sat, 24 Aug 2024 16:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TL7Ic8nc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDA02BAE5;
	Sat, 24 Aug 2024 16:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724517879; cv=none; b=i0Mm7WYPXvf/GUvSNiEW5keypEg70miRYw7eWuOl1S3NJ356IdLp5tFddU0niJESEOwhF+HHRrsD+ciHaUszzTudAlOUSo+XRQ0EpPOSy5Z0ASrJGXJbG4hp2ISOL3OyZ5D7NioY/SbAfJATcnjh09XkWBoWN3vlF8wBB0MMiNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724517879; c=relaxed/simple;
	bh=5VckT6C4lSjjpO3URAl6WTLJOhszXgeGfBoagM2Mtus=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BCouxsxcXFx4p4QR4vjz+JoTbHpL63JUUL8uZoaXpgq5BvDPIdQYypeXhYfbpFhSCB+vAYYjzMzHpCc/yYoM5WDFCUMs3Bn5YaEIoGjpvQK7JbOFrt2J1M/nrvv/maYvA3vu3Am5/tJ3SWqom2Alz8LJS2MCSxX5QJVi2zc7Nyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TL7Ic8nc; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2d445c87788so542105a91.2;
        Sat, 24 Aug 2024 09:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724517877; x=1725122677; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5VckT6C4lSjjpO3URAl6WTLJOhszXgeGfBoagM2Mtus=;
        b=TL7Ic8nc60QnJOIKki9uhMUBFaTdLR1rSqTFU5I3JZEM9z67BmAPAcNMDRFDAwPoHs
         RhrVS/8mKXVCrQ+Z9IQ9wnUk7Xad/XIe/dIfKwIlp4R4dUXkSHpASjwLiD01LUmQXIOe
         oDIF58oQpMl+riS48V3emQtaSY6A/Ky9vXe6XWKt6ww0P50m7UJ6JHHdG9NN0INvxEnG
         Lz/XQ9mCi1xlpgy5Gn9tAWs2bjUeN/bRZr9V2UJMvFaSbiEiWInC/+Kk+DDeXSUlKhl5
         bDhOm5SwmvmmUrJtXVn8OSzKV46MvZh/ne5SKo0zXxNFESvjEWnIBfkSlnMWbx4wXC6V
         GgKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724517877; x=1725122677;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5VckT6C4lSjjpO3URAl6WTLJOhszXgeGfBoagM2Mtus=;
        b=w+A4BGwzo1mHuH06m5kKrQjNDTtEd8tNHfpAULu6EF5i2VfRrCw1sdM1Q4o/PD9XWD
         +V+9t3b+41S2TH3KTF8OJpPzklhj/uOK34UIQtjxqoj6/5ifkvLnrfG74PgwksE72t9o
         8GCF6W6D/1hibr3WVdx98xdkNMgX7bkHRBq/YNfd6kOAID4B77T+mIuRLGpzUPIsPkdi
         gEvPMaHHSY4qdJF1EkNE+a1I9CnyNmG7NudOM14qhw6ktiKa/SZrMDyUO7woEcimFbIf
         GWS6E5r8ewFmWBOfaHOdHz3JzBr6hY3hR3ktGtuKK+vfrtklcMF20CEDx75LASb1qgN6
         5nPw==
X-Forwarded-Encrypted: i=1; AJvYcCUbp/a11Lt6z6pBIkDeMFuKCmVexztDBXgB2iVH+ySwdWvRi9FjKYf+kGn3sUWJIiFmIF8bRlAYzS6T2IUQ@vger.kernel.org, AJvYcCWMPr7SL65ywSAKjlIQLKN5cLobQB5s9H8F7y0PgmCXiLIYzS1KRtafjy8FaTZDJVKuRD0oDUY2NcMeJd4NAA==@vger.kernel.org, AJvYcCXAd9FsuzHY7qEYY9+56Mm0P3aOlcQbuUmwyUep+NYTQyOp43SMhq4ufZH0LWtTbGzoVb0iAmngEJVmAN62i49lhxc3@vger.kernel.org, AJvYcCXoI2sKgvBLvDlY4AduQ5rlxLLh2bb/TGOGmH1ZH4GopU63Vum2yJ1SrB+AlL/6bKFZHDuVtHAWEGTRjp0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9pS6jJ9++57gSX4IGKdwDpHb5TwtmcuU5V3LjeSkw9I+alKLY
	C87s/lRcYzZH0ygli+aZ0f1AuzmK1i1u3c9hCilGeMfH6zak4lSqt5M2J7+DTD0y1J3UPD7OLSz
	2QeS5I4byjVzdjyeP9Of70GOIYk0=
X-Google-Smtp-Source: AGHT+IEl7BAFxfHi+EpkQ9x8ZnTnRaIB9YCOcUQ4mLNHiby9rEr662m+9/mPWrhYU+1Uom3efmCrMPDR6ERV54CtnQg=
X-Received: by 2002:a17:90b:1b12:b0:2c4:cd15:3e4b with SMTP id
 98e67ed59e1d1-2d646d73d60mr3927811a91.4.1724517877442; Sat, 24 Aug 2024
 09:44:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240821040700.1919317-1-kris.van.hees@oracle.com>
 <20240822181942.2626536-1-kris.van.hees@oracle.com> <20240822181942.2626536-3-kris.van.hees@oracle.com>
 <20240823165329.GA3911831@google.com> <ZsjBfjAuC5t/2Cex@oracle.com> <CABCJKucamgTpEhU5E=dL3tNc84yzwzFh7uNW-arhN-qDm-3nMw@mail.gmail.com>
In-Reply-To: <CABCJKucamgTpEhU5E=dL3tNc84yzwzFh7uNW-arhN-qDm-3nMw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 24 Aug 2024 18:44:24 +0200
Message-ID: <CANiq72=PNDOYo8kwscy0Sup6g3qfffFsSJMssJh_jGb3D4JzcA@mail.gmail.com>
Subject: Re: [PATCH v8 2/4] kbuild: generate offset range data for builtin modules
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, Miguel Ojeda <ojeda@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	Nick Alcock <nick.alcock@oracle.com>, Alan Maguire <alan.maguire@oracle.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Jiri Olsa <olsajiri@gmail.com>, 
	Elena Zannoni <elena.zannoni@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2024 at 7:24=E2=80=AFPM Sami Tolvanen <samitolvanen@google.=
com> wrote:
>
> I assume they wanted to avoid conflicts between Rust-specific
> environment variables and existing Kbuild variables. Note that
> KBUILD_MODFILE is also double quoted for the C preprocessor, which
> isn't needed for Rust. Miguel, do you remember if there's another
> reason for the different variable name?

No, I don't recall another reason -- I think you are right, they did
not carry (exactly) the same contents, and thus the different name.

So I think it can be merged/changed into something else if needed.

Cheers,
Miguel

