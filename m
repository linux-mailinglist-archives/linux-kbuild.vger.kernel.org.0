Return-Path: <linux-kbuild+bounces-9046-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 77892BC527E
	for <lists+linux-kbuild@lfdr.de>; Wed, 08 Oct 2025 15:14:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 724EA4E4354
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Oct 2025 13:14:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E04F27E04C;
	Wed,  8 Oct 2025 13:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="QLpWyrZT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1990A31
	for <linux-kbuild@vger.kernel.org>; Wed,  8 Oct 2025 13:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759929270; cv=none; b=Lgjx2apADA8fXEdagWwzZLWoEyBhBCIaZwhvALz26+2MXKPcqIGSDfjJ3t7n7KARCdtG9Nk2ehGq0VjQj/zJWaWkOogo4hyckMZppXJA4f11lqLnw0kZHz9h9L5YMyehooObomIHhJcfjD600ZjSBn0DxoLfdNPtXdCJtvyApN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759929270; c=relaxed/simple;
	bh=PdWVBBkA52sDRjTk2ne2LFVnrggwsvKZ1JT2sYuDyk8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LatV8QVd0sKXBfs6uq1EkImqc0m1yHGfZmaOOPEwuuLQ1eIqW8B3OSYbjPHZm+DpCH6TWyM32TDDwWiw4OcdpuJSoCoC2yQMA8HdH2VpA8uvMz8MK7X2LX3M/eZQnNBoZkLzgHMMoF1f/XgIySTpbPqumM5t4aBwiMDpLSstRas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=QLpWyrZT; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b3c2c748bc8so1074308066b.2
        for <linux-kbuild@vger.kernel.org>; Wed, 08 Oct 2025 06:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759929266; x=1760534066; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NaY2N0oDvWpK7NE8eBCGe3YYI68gQsJWyCuxusejoXI=;
        b=QLpWyrZTHL5c947snWdjtu3GvvqNZIAC2D3oheBS0vSUh1DhzdAtoLDS0/XrgkLn9M
         vdLh9UTxWnZqeeljjN6AS4woZc4oawFIzWFfzxsIkbW8YayMMpaPWJ9POerruDGLgyi6
         IeZ/RIMJKhCI9LzVPMdS8M1wAXx+RicwtdwxApNyr/VLLv9ObyXH1uN3c9IfCJoeEtan
         aZeVckpwkrcTChyYVvoSB25hgTzAGcAMg9UEI+0Oct5oNtUq8gp1+iBvduXHYvM5mpR0
         v40NhTlnuRSz3KcXRY39HKruoG19uTXMokiKl6s0Kel8bbnoXdEEnAR+WnUL0cL41rBz
         R06A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759929266; x=1760534066;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NaY2N0oDvWpK7NE8eBCGe3YYI68gQsJWyCuxusejoXI=;
        b=Lkt9cu1QwPr5qBr0Tsl7ipXYOvRlOhexDvu5xrMEkcg0XYjBi2Kc2Ill9w7e7RoFD1
         R7brpTd+obbvLGnYPl8Ex8c7VqJ8VEE2GfwoUO7lDdMT4er/NxfmL11vD/slvOzhH24z
         41HsP85TaBj6yAPhyrOgvMZIoEKigiT79vnNpfq8ZpdGNPenv7OGB5zu2iXpK5RGYZuJ
         SCcCIJ4feg/lNbobTzWadXGjQhhKcC6dlHKU2HxdBLhwu1mp255IJxLWULILSQ9i89qw
         fpRepBPSFLUkadT5Q2ISvWOm+c2Y5n9m/8uZe6yYTsb3W+Z+47fNDIvhiZfIxU2RDK/Y
         k+Vw==
X-Forwarded-Encrypted: i=1; AJvYcCWIYT9+H+u86kpplv7p3KqiJUgqm+oRIsvkZO1QRdASiO8+4L5Uqd5cGaWg0TmF7OxqzfAFCd4QGM19FTI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfpM6eTWyrKCyFyM+CeQ38ByWTDOz+cSsOXcZ4b6y6Ej3yBS/D
	/ujM00+VgV1tSta3z1F7k3OYOhcG8twZnOH6kor0+C3QLaUcdqPpbK/UjJ4yaUimwx8=
X-Gm-Gg: ASbGncvScRq6FOmGVAWK4PMn2ZitylmB3oBIS+4BRaogoe+XwKnQIz6Ktlleu+1AApc
	vUcW2oE/7xCF+tAjNzZzsCXV4xRt9aOjOE5U74zZDDPE0Aq+Uc0nrzItLZ7jObbJNFa+8odWcOc
	QdEPO8nUYE2+caSHzqxU0eLzqkOKbwZSgFfX+WWLGo/a4Jd92GPmW+DrFk2EDRtmCZAc0HSIlAf
	EfO+8POL2wNh78gaiPDOx90eOdSFU9PM+Yjq9skHkWamxYVV8h8HIS/3+vmmI8XJYBvWN1QihcX
	DZfMecqM7j5X8nscjbzb7wKPqgCfU0JuPk9fuLQAlc42UJS1hMBMl6xYGpVhySNUNpBk1aVtqYw
	fa1DJNBcwatRQ8brebZ3Af6zY2s5tyIqwCTINTrJAMC5mV7tfig914qdmShWZZ7rz
X-Google-Smtp-Source: AGHT+IHcDTahBvSA9DjGwetRnV64ZXy70/FjjTjnrQed/ev3/o4UscoPNE9s2/VK++lhFIcpnHrsRw==
X-Received: by 2002:a17:907:7e82:b0:b41:c892:2c6e with SMTP id a640c23a62f3a-b50ac7e6c8emr393155566b.43.1759929266063;
        Wed, 08 Oct 2025 06:14:26 -0700 (PDT)
Received: from pathway.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486970b315sm1660759166b.64.2025.10.08.06.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 06:14:25 -0700 (PDT)
Date: Wed, 8 Oct 2025 15:14:23 +0200
From: Petr Mladek <pmladek@suse.com>
To: Lukas Hruska <lhruska@suse.cz>
Cc: mbenes@suse.cz, jpoimboe@kernel.org, joe.lawrence@redhat.com,
	live-patching@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, mpdesouza@suse.com,
	Josh Poimboeuf <jpoimboe@redhat.com>
Subject: Re: [PATCH v3 3/6] kbuild/modpost: integrate klp-convert
Message-ID: <aOZjr7YTSrT-BznV@pathway.suse.cz>
References: <20240827123052.9002-1-lhruska@suse.cz>
 <20240827123052.9002-4-lhruska@suse.cz>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240827123052.9002-4-lhruska@suse.cz>

On Tue 2024-08-27 14:30:48, Lukas Hruska wrote:
> From: Josh Poimboeuf <jpoimboe@redhat.com>
> 
> Call klp-convert for the livepatch modules after the final linking.
> 
> Also update the modpost tool so that it does not warn about unresolved
> symbols matching the expected format which will be then resolved by
> klp-convert.
> 
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -1676,10 +1680,18 @@ static void check_exports(struct module *mod)
>  		const char *basename;
>  		exp = find_symbol(s->name);
>  		if (!exp) {
> -			if (!s->weak && nr_unresolved++ < MAX_UNRESOLVED_REPORTS)
> +			if (!s->weak && nr_unresolved++ < MAX_UNRESOLVED_REPORTS) {
> +				/*
> +				 * In case of livepatch module we allow
> +				 * unresolved symbol with a specific format
> +				 */
> +				if (mod->is_livepatch &&
> +				    strncmp(s->name, KLP_SYM_RELA, strlen(KLP_SYM_RELA)) == 0)
> +					break;

Just for record. There must be "continue" instead of "break".
Otherwise, the function does not check the remaining symbols.
It won't copy CRCs of exported symbols. Finally, depmod would
complain about incompatible versions of symbols.


>  				modpost_log(warn_unresolved ? LOG_WARN : LOG_ERROR,
>  					    "\"%s\" [%s.ko] undefined!\n",
>  					    s->name, mod->name);
> +			}
>  			continue;
>  		}
>  		if (exp->module == mod) {

Best Regards,
Petr

PS: I am not sure if this patchset would ever reach upstream.
    But we found this bug when using the tool...

