Return-Path: <linux-kbuild+bounces-4998-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 407AE9E489D
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Dec 2024 00:20:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CAB8F280C26
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Dec 2024 23:20:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 510B52066D5;
	Wed,  4 Dec 2024 23:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bjCfsuZ7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FC42066D2;
	Wed,  4 Dec 2024 23:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733354381; cv=none; b=i1GIc0Gu5m9ueYQA1CTXPCYW1lnqxt5vuc1DshE4ekbjUtD9zOkGC/Il9PcZKFENUxdrWQTaq6Ej7JEQg5Yy7OjzyyIUEHkNUNakNz+uvJe3FeAoHymudCDICBqdkW7Ua7MxEfACDv0MG/eYYOsuJSlw6d37Vcnuv5BBx+myRwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733354381; c=relaxed/simple;
	bh=aLyw0KOSxAIH3WlBepY1cZWC/6vHhRQIOTGUII8E1F4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qVqYVJOqFirIJ68O/Lxfm+ndbcmuUoHKby6KHkGs5N/qXhkW+O4gAX5Z5qox/O115ZyTwYwti5M0pT46QnsrqC7WXe+Gw589wgGzupPDfGWw4k9aQXm9S5XiRyslx1e8E8Bq2eMxDnGTRj9MqgCThC07rrh6/9ML3ftZCQoRtrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bjCfsuZ7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59978C4CECD;
	Wed,  4 Dec 2024 23:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733354380;
	bh=aLyw0KOSxAIH3WlBepY1cZWC/6vHhRQIOTGUII8E1F4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bjCfsuZ7y/KdUmXUxDs4hUyWEA5jWVDKQquGmbYR6+l5mj/kdDrjSJFdSH4iQ0G/2
	 sg4PXX2ZKO+8HKiXXyELWUfRjP84Oesc/85SB78sT/ApAtyZZCI2kV6k2Lh7Y+Y/ql
	 IPQmK78F9RxJNc8nsfGP5JfSQCquwkCPMmVf1jYYITEI+uboPhkwv00ILpUiFUgTXB
	 QcryGy27Muxs5jbnT7M/nMly7OOX9EOEKFh2brD80iwnNsBOOnFLYaH0QWvcTNsVzV
	 Qcn0bTT72QP/gDDK/4tsFkMG9EbPuaVCY9fk8Zq2gr/9gJDRwN6W70ZkvA+br/yhZf
	 DcY+EOi+SWxgw==
Date: Wed, 4 Dec 2024 15:19:38 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Ole Schuerks <ole0811sch@gmail.com>
Cc: linux-kbuild@vger.kernel.org, jude.gyimah@rub.de,
	thorsten.berger@rub.de, deltaone@debian.org, jan.sollmann@rub.de,
	masahiroy@kernel.org, linux-kernel@vger.kernel.org,
	nathan@kernel.org, nicolas@fjasle.eu
Subject: Re: [PATCH v6 02/11] kbuild: Add list_size, list_at_index,
 list_for_each_from
Message-ID: <Z1DjikoDzwIAID5T@bombadil.infradead.org>
References: <20241028034949.95322-1-ole0811sch@gmail.com>
 <20241028034949.95322-3-ole0811sch@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028034949.95322-3-ole0811sch@gmail.com>

On Mon, Oct 28, 2024 at 04:49:40AM +0100, Ole Schuerks wrote:
> +/**
> + * list_size - counts the number of entries in a list
> + * @head: the list whose entries are counted
> + */
> +static inline size_t list_size(const struct list_head *head)
> +{
> +	size_t ret = 0;
> +
> +	for (struct list_head *curr = head->next; curr != head;
> +	     curr = curr->next)
> +		++ret;
> +
> +	return ret;

What's wrong with list_count_nodes()?

> @@ -310,6 +325,40 @@ static inline int list_empty(const struct list_head *head)
>  	     !list_entry_is_head(pos, head, member);			\
>  	     pos = n, n = list_next_entry(n, member))
>  
> +/**
> + * list_for_each_entry_from - iterate over list of given type starting at a given node
> + * @pos:	the type * to use as a loop cursor.
> + * @start:	the node to start iterating at
> + * @head:	the head for your list.
> + * @member:	the name of the list_head within the struct.
> + */
> +#define list_for_each_entry_from(pos, start, head, member)  \
> +	for (pos = list_entry(start, typeof(*pos), member); \
> +	     !list_entry_is_head(pos, head, member);        \
> +	     pos = list_next_entry(pos, member))

list_for_each_entry_from() exists on my tree on linux-next added
through commit e229c2fb3370a ("[LIST]: Introduce
list_for_each_entry_from") since v2.6.17, so since 2006.

> +/**
> + * list_at_index - retrieve the entry at index i in O(n)
> + * @i:		index of entry to retrieve.
> + * @head:	the head for your list.
> + * @type:	the type of the struct the entries are embedded in.
> + * @member:	the name of the list_head within the struct.
> + */
> +#define list_at_index(i, head, type, member)               \
> +	({                                                 \
> +		type *__pos;                               \
> +		size_t __counter = 0;                      \
> +		list_for_each_entry(__pos, head, member) { \
> +			if (__counter++ == i)              \
> +				break;                     \
> +			if (__pos->member.next == head) {  \
> +				__pos = NULL;              \
> +				break;                     \
> +			}                                  \
> +		}                                          \
> +		__pos;                                     \
> +	})
> +

Seems like the only thing being added. I'd just keep thsi internal
to your code for now, and later if we really want we can add this
as a generic helper. If you really want this on list.h I'd recommend
to find a few users of this already in kernel and generalize the common
thing to use it first and add it that way. Then you separate *that*
patches series from this one, and address that first, and address
the addition then as a seprate patch series.

If you keep it to the tool itself, just change the namespace to be not
be as generically named of course.

  Luis

