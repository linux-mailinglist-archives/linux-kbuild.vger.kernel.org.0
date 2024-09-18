Return-Path: <linux-kbuild+bounces-3615-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A547197BED0
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Sep 2024 17:45:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D5831F2206D
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Sep 2024 15:45:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 084C11C8FC2;
	Wed, 18 Sep 2024 15:45:25 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.avm.de (mail.avm.de [212.42.244.120])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CE81C8FDC;
	Wed, 18 Sep 2024 15:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726674324; cv=none; b=qPOk2gi9nq1ZcCbib2LxsLtwTKEPYOt2wDmb9m6pb/8+4zaLAVRtcc28vIquHv5Bmsacgg+JBcRdKLVVbgbVTv41/fAIVTAQxZKyWcrsEM6kNExi1AohhBcn8Fg7aKFqffzDem43IRA7V3xFzW8cUkW2nONdWsMl1tnLhhXtL1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726674324; c=relaxed/simple;
	bh=vT1Y0UqaLEAKFSx47RfrD0JyfRvV1cCa6HGTTVHsMYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eUpsEtcyHvXz2p/ju263h47PbI0MbZz0ANXS5f8cJi8f+UtdoCik26jAaFi5KvLQo8fciOtY1yl7qb5JlMpg68i0PUOwm5nh0fbpVL4FfJqKRLJ5ADanZDOzcc9tKx/jNCPJw/D/wFJpwx2V65UjQ31TuPLzHDaGEP2E0JoDHPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=fjasle.eu; spf=fail smtp.mailfrom=fjasle.eu; arc=none smtp.client-ip=212.42.244.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=fjasle.eu
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [212.42.244.71])
	by mail.avm.de (Postfix) with ESMTPS;
	Wed, 18 Sep 2024 17:35:02 +0200 (CEST)
Received: from l-nschier-nb (unknown [83.68.141.146])
	by mail-auth.avm.de (Postfix) with ESMTPSA id 67F708075F;
	Wed, 18 Sep 2024 17:35:01 +0200 (CEST)
Date: Wed, 18 Sep 2024 17:35:00 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 01/23] kbuild: doc: update the description about
 Kbuild/Makefile split
Message-ID: <ZurzJIq4ZTKez_w_@l-nschier-nb>
References: <20240917141725.466514-1-masahiroy@kernel.org>
 <20240917141725.466514-2-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240917141725.466514-2-masahiroy@kernel.org>
X-purgate-ID: 149429::1726673702-64E96D67-99492577/0/0
X-purgate-type: clean
X-purgate-size: 703
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate: clean

On Tue, Sep 17, 2024 at 11:16:29PM +0900, Masahiro Yamada wrote:
> The phrase "In newer versions of the kernel" was added by commit
> efdf02cf0651 ("Documentation/kbuild: major edit of modules.txt sections
> 1-4"). This feature is no longer new, so remove it and update the paragraph.
> 
> Example 3 was written 20 years ago. [1] There is no need to note about
> backward compatibility with such an old build system. Remove Example 3
> entirely.
> 
> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/history/history.git/commit/?id=65e433436b5794ae056d22ddba60fe9194bba007
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

Reviewed-by: Nicolas Schier <n.schier@avm.de>

