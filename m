Return-Path: <linux-kbuild+bounces-479-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 573C8825644
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Jan 2024 16:02:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E42431F22357
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Jan 2024 15:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BAB52DF87;
	Fri,  5 Jan 2024 15:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="QWAzhKpe"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C1D2E3F0
	for <linux-kbuild@vger.kernel.org>; Fri,  5 Jan 2024 15:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a28a997f3dfso135260666b.0
        for <linux-kbuild@vger.kernel.org>; Fri, 05 Jan 2024 07:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704466910; x=1705071710; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lQR4Fg8cleRVcvnVry6aYWkKu4ehqJLNDHFhxBeysRs=;
        b=QWAzhKpeKQWUQuQP2MyvTczQkch8FEQwqwIRd5ueyGCbfrmx6YIG23QJYDh1B1RXow
         qA2XYnrwVVjAJXi53646aRBntfxo2KRx/MC0iQ8c0Saf0ROp7FoFOn3xEffXvkVnsXPM
         mbj/PJPl7PaaLWiGSGe8LMxABE0Tcu/OgTX9Ymqu2+3asB5m+SbDiq75F8cPs3PT2Tbp
         Xo0BXAC3CBi6krWg2N5reD1auiONCC77OPejZ5XCoXe/sjpu6DVXoxWBmvKnZI9mY7aw
         HcVPQGJQJ7UpcFPRLp4o/24m7Em1/f/4BmN+NGFboGaNEqOdukMkbArLTcCuoMOU/uV8
         Gx1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704466910; x=1705071710;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lQR4Fg8cleRVcvnVry6aYWkKu4ehqJLNDHFhxBeysRs=;
        b=uOCYGj+JbrDp1COrk/my9tUWICsQBKTBGsh4a/tbPn2VXj0VfIn5KZnxzjGXxHA+E9
         D7wBfKJFYgWBl9pzKNqAs9sLjpHfzjU99NYWh34L5P8tNQzjByPxnNJ5ObTYZmVWpKwT
         /E1BP4iPAjKSw1OSPXyH26lyDOem6kofltk/RIfayRAslr7KAxcmYIuO8EcWwGx4LNVZ
         xpcuoYzLa4mRn9x6SqBiMbSfuZ5iVfsm1+vQJKj5yLMe96wdd22zhKCWF+f5we3EHfDZ
         Msv2KmxUNe5r9Gtk6vUpLG7MzIfR91QBZp+OPoQbZKh+zjhvZ3soGBGIs6pRDIm4V71m
         l07w==
X-Gm-Message-State: AOJu0Yx0RraEvNtLgjPLF2e/eSqZygqU84/s7ZgpcrftSo1wdU72Vp45
	4+ox97YB9pX/yq6OW8bFKozLNAGj3Wpfsg==
X-Google-Smtp-Source: AGHT+IG4hdWPcou8wDiQkdCfkBpIFfeLKQzUP3/H2ExfW99dzG+PEi22wr0raKPLobI28PfHOrtBBQ==
X-Received: by 2002:a17:906:22cd:b0:a27:773b:fcf1 with SMTP id q13-20020a17090622cd00b00a27773bfcf1mr1159545eja.9.1704466910388;
        Fri, 05 Jan 2024 07:01:50 -0800 (PST)
Received: from alley ([176.114.240.50])
        by smtp.gmail.com with ESMTPSA id dx10-20020a170906a84a00b00a283185ccd9sm968861ejb.90.2024.01.05.07.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 07:01:50 -0800 (PST)
Date: Fri, 5 Jan 2024 16:01:48 +0100
From: Petr Mladek <pmladek@suse.com>
To: Lukas Hruska <lhruska@suse.cz>
Cc: Miroslav Benes <mbenes@suse.cz>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	live-patching@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Josh Poimboeuf <jpoimboe@redhat.com>
Subject: Re: [PATCH v1 2/5] livepatch: Add klp-convert tool
Message-ID: <ZZgZ3LYSZARBjYqo@alley>
References: <20231106162513.17556-1-lhruska@suse.cz>
 <20231106162513.17556-3-lhruska@suse.cz>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231106162513.17556-3-lhruska@suse.cz>

On Mon 2023-11-06 17:25:10, Lukas Hruska wrote:
> Livepatches need to access external symbols which can't be handled
> by the normal relocation mechanism. It is needed for two types
> of symbols:
> 
> --- /dev/null
> +++ b/scripts/livepatch/klp-convert.c
> @@ -0,0 +1,283 @@
[...]
> +/*
> + * Formats name of klp rela symbol based on another given section (@oldsec)
> + * and object (@obj_name) name, then returns it
> + */
> +static char *alloc_klp_rela_name(struct section *oldsec,
> +		char *target_objname, struct elf *klp_elf)
> +{

Nit: Please, use @lp_obj_name instead of @target_objname.
     It would make it consistent with the caller:

	klp_rela_name = alloc_klp_rela_name(oldsec, lp_obj_name, klp_elf);

and also with

#define KLP_RELOC_SYMBOL_POS(LP_OBJ_NAME, SYM_OBJ_NAME, SYM_NAME, SYM_POS)


> +	char *klp_rela_name;
> +	unsigned int length;
> +	int err;

Just for record. The name "lp_obj_name" came from a discussion between
me and Lukas about the KLP_RELOC_SYMBOL_POS() parameter names.

The macro has two object name parameters. And LP_OBJ_NAME aka
LivePatched_OBJ_NAME looked better than TARGET_OBJ_NAME.
The name "TARGET" is too ambiguous to me.

Best Regards,
Petr

