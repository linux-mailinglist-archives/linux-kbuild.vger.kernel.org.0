Return-Path: <linux-kbuild+bounces-5078-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FB99EC3BC
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Dec 2024 04:49:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D3FE188B615
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Dec 2024 03:49:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C290920CCF3;
	Wed, 11 Dec 2024 03:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UbLmsbOk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9889520ADF6;
	Wed, 11 Dec 2024 03:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733888948; cv=none; b=h1Nn5QKEE+zEJAS7IPo6YKfq8oWkLAeqqFH66zPx/c2zN/gGwaLSLjSpkel822T/YNLoN3zDbUCe4IcANhJnkLgwauGN9yN4EpCxEHIsA+1Jg7gboqpg3AWVbDBqFWA6FWtPwcnX+W1pWNuJqpPnPYuorOCFhK+cNYd+5QAyFbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733888948; c=relaxed/simple;
	bh=bF/RDK+PQddcnvljoqWuZ6jQnJJj1VQLmv8ZjXL6iTk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KHFbDuyh7kbeTozivbq/G4EzA06F+Y7luY4LpAk30QIQ/lZrfwsWWnlu+kuHM5nP41bUnKzPhvQJpcQsouB34SM0qQonWAl+Ah9ZthKRfoZgxA1mMQHAVwznTnN33Cxzmn+CIxbuUhRAYiPGqevJdAbkc9v3rQPqV51y0inq+mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UbLmsbOk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC070C4CED2;
	Wed, 11 Dec 2024 03:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733888948;
	bh=bF/RDK+PQddcnvljoqWuZ6jQnJJj1VQLmv8ZjXL6iTk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UbLmsbOkXZld5B5TJZ3y3dEHi/jL+D8a3iOi+uJAnftwXBxXr0uxOEl+9fzqffrTB
	 k7kwMP+Q+wPcZppdoKg6zAl380iiVtQki7zfhVRN5dFgUrVxOIbqnkkPVvE86i26hX
	 qK2aMQOqCCugs+iFUQAKJvZ7BRcHfiIGgSRYnBdLqSa/gWWu7UpIemUXmPrDzlX40W
	 lXllGpz3O0W4LMp4Poi4LT2UF6bBMzD5oPtMetxBa1NfdcRMwQLAroY4Kq4P+F9FLJ
	 6iQL+HrDhFeNQUhJRVkXJmXO2OkSAMCAyh7qr5weRGUJ7xhWjCxHh1UFXpDwF0ZXTm
	 Ojw7cNcMcoY8g==
Date: Tue, 10 Dec 2024 19:49:06 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Ole Schuerks <ole0811sch@gmail.com>
Cc: deltaone@debian.org, jan.sollmann@rub.de, jude.gyimah@rub.de,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	masahiroy@kernel.org, nathan@kernel.org, nicolas@fjasle.eu,
	thorsten.berger@rub.de
Subject: Re: [PATCH v6 02/11] kbuild: Add list_size, list_at_index,
 list_for_each_from
Message-ID: <Z1kLskERnpeH1A45@bombadil.infradead.org>
References: <Z1DjikoDzwIAID5T@bombadil.infradead.org>
 <20241209010019.52601-1-ole0811sch@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209010019.52601-1-ole0811sch@gmail.com>

On Mon, Dec 09, 2024 at 02:00:19AM +0100, Ole Schuerks wrote:
> > What's wrong with list_count_nodes()?
> 
> > list_for_each_entry_from() exists on my tree on linux-next added
> > through commit e229c2fb3370a ("[LIST]: Introduce
> > list_for_each_entry_from") since v2.6.17, so since 2006.
> 
> These macros only exist in include/linux/list.h, not in
> scripts/include/list.h. My assumption was that the build system should only
> use scripts/include/list.h.

We can update scripts/include/list.h from include/linux/list.h. So just
say, bleh blah exists in bleh bleh bleh.

  Luis

