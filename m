Return-Path: <linux-kbuild+bounces-2306-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B63EC91EBDC
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Jul 2024 02:37:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6251D1F22491
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Jul 2024 00:37:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 045E03C38;
	Tue,  2 Jul 2024 00:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eySe6bHb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8593F383
	for <linux-kbuild@vger.kernel.org>; Tue,  2 Jul 2024 00:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719880630; cv=none; b=ZImmyBlOSBxnJchmkTQ27l9huWFCY8Rhg05n0E8biVm/PZKj4zcScK2aZS6F15kgJiyjjoEyToIDff4MEacu5PW+9u7cSpUpg6a4gmjpx7dP9/8bZOcTYKX6u6qG211YIbRVXg5epnYgcJvmewkok4xom4uaPpHRI6lEDfu7n74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719880630; c=relaxed/simple;
	bh=xjNhwegseZxa+wPnX378WznPJ7qA40LR+14IJSitpx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ex4j0GhvoCs6Nnm0qtfTTyyk1EqOGNDzwq9osB2+1ls4vMPKW4ZlZORK/xaQ0uEAkXwxnghWaUzSpjJX77H744T6ph/BgcxUOP4/WWAT2Fl0qkJeFJP6MCbk/iaWCcjznsudweRMeyj7yeZhsgTvIin8GL4LzF5F3Ge+uls1hrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eySe6bHb; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-72ed1fbc5d9so2413188a12.0
        for <linux-kbuild@vger.kernel.org>; Mon, 01 Jul 2024 17:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1719880629; x=1720485429; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EGDoRX5hAqO8PwwC4Hg1+0blguzHjasQUuaesCxM/s8=;
        b=eySe6bHb1e5AD8ziVPO5iDccEmSLhvytp3rtgT3DkxrxfR5zxVYcYiXeoahaToxHYj
         0QW1MCxKTUpOb/h3gEgAYZCyDo5boaWaGeLLADMpfolBjEGadoYIyCRI+/2FkvltMTHE
         V6jKOGlNahiL1IwNb7AQ40+rZS+Zvub9TcBuU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719880629; x=1720485429;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EGDoRX5hAqO8PwwC4Hg1+0blguzHjasQUuaesCxM/s8=;
        b=CNLV00fwHCAGmrmzWKg5tuAxxx49c38nRhcukdI1lwEmhXLC3IFEK8rRBo9v5upwqf
         Jjd+IH2QQshT+MNZGK7uMn32jUbiR8aVnBfmiWd1AXnIKGNRCuiufFTFGgBnutd5yivF
         ZCnRKFvYBpHjgs+2qJAuxTuiUnMjoqQGPqKnNwB9a5RCx0Jyxu1Ge7XS0RBaSEuLvkEI
         /nR3BEBN1SHEfgn3cTklDIm37Dv7AzXPr3Cp8VmnNljAIBwXEV1JnR5T8HWIu2nRJ+CT
         XQ8UuKEdlH6OAQqfniOGLWWJ3VPaw98kX1rV3c56MpjVKRu0NBwAZ6FrJpcV59ju8i4Y
         Y3pg==
X-Forwarded-Encrypted: i=1; AJvYcCW+62xqxuiPneERGeh67UaFC5PInZ0wez93YhseJ55l/2iZycye85Yj8MsDjA1vjR6MxpWk/aNhqpGQ/YknkN5YgGBQRCMY2TVvYQJc
X-Gm-Message-State: AOJu0YzkpKI191f5E4ivd5idb8Y4L8nlwK+PQChpHpBBLP5HkgwdipS4
	U8bVom5TvSysTb4xvxLzWGpAtrHTtzrTfQJ6VIf+JBaZvH7+/NcdMByoP6gHuUg8+zByNVviaAq
	KEA==
X-Google-Smtp-Source: AGHT+IEuhhzXtZrd0JiWuZnFOSvhEHM2BzvRMBd6uaxAMe4aKkZEMnOWfE6Y2YwsIhfyj80jb1P8GA==
X-Received: by 2002:a17:90a:448d:b0:2c3:40b7:1f6d with SMTP id 98e67ed59e1d1-2c93d5e9fb4mr6972030a91.0.1719880628872;
        Mon, 01 Jul 2024 17:37:08 -0700 (PDT)
Received: from localhost ([2620:15c:9d:2:32ea:b45d:f22f:94c0])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-2c91d3bc525sm7397535a91.45.2024.07.01.17.37.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jul 2024 17:37:08 -0700 (PDT)
Date: Mon, 1 Jul 2024 17:37:07 -0700
From: Brian Norris <briannorris@chromium.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, linux-kbuild@vger.kernel.org,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: possible dependency error?
Message-ID: <ZoNLs_9nFHvm6Nqw@google.com>
References: <ZGVi9HbI43R5trN8@bhelgaas>
 <CAK7LNAQPXapu3Ydh9XaB2ggGqgfYX5mo0pHPNHDcnm=w3ubYag@mail.gmail.com>
 <Zk-C5Eg84yt6_nml@google.com>
 <CAK7LNASrR2W-obUurSWaKLnQ+CB1o9iuoaM-hbHnv-zoazMzmQ@mail.gmail.com>
 <ZnIYWBgrJ-IJtqK8@google.com>
 <CAK7LNAT9n9cQ_5mZ6rE+VD-KwOQm_Rjq=Q-Cx7ib+bSqmbbubA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAT9n9cQ_5mZ6rE+VD-KwOQm_Rjq=Q-Cx7ib+bSqmbbubA@mail.gmail.com>

Hi,

On Wed, Jun 19, 2024 at 03:02:35PM +0900, Masahiro Yamada wrote:
> I do not see any maintainer for tools/build/, but at least
> you can find who is picking up the patches.
> 
> 
> masahiro@zoe:~/ref/linux(master)$ ./scripts/get_maintainer.pl -f tools/build/

Thanks. I've factored some of this into my addressee list.

> OK, you bypassed fixdep for fixdep itself.
> 
> fixdep will not be rebuilt when the command line changes,
> but it may not be a big deal.
> It is not working that way already.

Yeah, that was one rough edge. I didn't manage to smooth that one out,
but like you say, it's not really much of a regression. (It *can* work
today sometimes for just the right kind of incremental build, because
you may have a pre-existing fixdep laying around that will be used if
available. But it's not really *correct* still.)

> BTW, did you have a chance to test your code
> with the -j<N> option?
> 
> 
> I quickly tested your change, and I observed new
> "jobserver unavailable" warnings.
> 
> 
> masahiro@zoe:~/ref/linux(master)$ make -j24
> mkdir -p /home/masahiro/ref/linux/tools/objtool && make
> O=/home/masahiro/ref/linux subdir=tools/objtool --no-print-directory
> -C objtool
> make[4]: warning: jobserver unavailable: using -j1.  Add '+' to parent
> make rule.
> make[5]: warning: jobserver unavailable: using -j1.  Add '+' to parent
> make rule.
> 
> 
> 
> The first line:
> 
>   mkdir -p /home/masahiro/ref/linux/tools/objtool && make
> O=/home/masahiro/ref/linux subdir=tools/objtool --no-print-directory
> -C objtool
> 
> is an existing noise regardless of your change.
> (I do not know if anybody cares about this either)

Thanks. I tried to tackle the existing and new noise in my posting here:

Subject: [PATCH 0/3] tools build: Incorrect fixdep dependencies
https://lore.kernel.org/lkml/20240702003119.3641219-1-briannorris@chromium.org/

Hopefully that's not horribly off the mark, although I'll admit tools/
is a bit of unfamiliar territory.

Brian

