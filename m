Return-Path: <linux-kbuild+bounces-13476-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WS5CD2DXHmo4VwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13476-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 15:15:12 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3210362E61D
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 15:15:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=T7r2VHcT;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13476-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13476-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BF7DC306DDD0
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Jun 2026 13:06:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E51DC3DA5B1;
	Tue,  2 Jun 2026 13:05:48 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAAE13E2ABF;
	Tue,  2 Jun 2026 13:05:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780405548; cv=none; b=Z9i6fiAQnavBzGn0YcTVWhkhE/BHETSBj6dnH7wbIq5JQyz7+VB1eJGM2imxYG8asX1jaNXuGZ8m9K9guXMhakpOgvUDtL88WuDq4ly7EmUBPvyCmIgI+GxIMOvSbeHmYntd+3JDHpmmg220SedDhrLLutKtX8mhqvIoJogW7Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780405548; c=relaxed/simple;
	bh=R4rifAFs2s+TZlxjw8AB2UOdkatMzU9MSx91KtXt/b0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u7NuR62Roe0udAZC8aUWQAkpP0ewxm4QANlesfA7PI4jiM1qzMbrAHh8l61/rDlL6yaEM7NG6aiqwMeHdh4LsfjUybqDvjHTmjWzybW9QlviVq7Lv36TKwIzh2th2QlM+F7sYWpFsI0ZgK/YliuRDbTcab8iKVpq6H1FGobk1TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T7r2VHcT; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 99E1B1F00893;
	Tue,  2 Jun 2026 13:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780405545;
	bh=Z+qRpMSGxeGjUnECZvbkT3/JILDjpUDbuyyzo7tyMxw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T7r2VHcTnPi0mqDf0C9atFMIUfcBVZGes9vlzfkoT0m+HLp14CJ23w+yy03ID6Ikg
	 eOSqHxa0C9LjptZ4rYFfyfuE+ioN0cO3/mJrRr77tiXBZVoaTaCguZu+abWy0QwWwK
	 yQH4mY0Av3XVqi+U6ozlW6U2sYZFKBL59gpeqM9UOYuz7VADkYYamfeJC/folGiCEh
	 NKkwHoc6slTBmDiBvdDHu0+ffPY1cXEceIjsoqg17b4sOTpS9dEs0Pakc+9qhD3IHr
	 OOybhG327Xu4p6BLo7MwMAy3QXeRrF0ki30oD81A/YdabNGesckKSXNBIP2y6YJp6O
	 6YoI5zh5BDbaw==
Date: Tue, 2 Jun 2026 15:05:32 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Andrew Jones <andrew.jones@linux.dev>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	nathan@kernel.org, andriy.shevchenko@linux.intel.com,
	rdunlap@infradead.org, julianbraha@gmail.com
Subject: Re: [PATCH v4] kconfig: add kconfig-sym-check static checker
Message-ID: <ah7VHBwxnn4pp0G1@levanger>
Mail-Followup-To: Andrew Jones <andrew.jones@linux.dev>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	nathan@kernel.org, andriy.shevchenko@linux.intel.com,
	rdunlap@infradead.org, julianbraha@gmail.com
References: <20260527142703.107110-1-andrew.jones@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260527142703.107110-1-andrew.jones@linux.dev>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13476-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.jones@linux.dev,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:nathan@kernel.org,m:andriy.shevchenko@linux.intel.com,m:rdunlap@infradead.org,m:julianbraha@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,linux.intel.com,infradead.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,intel.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,infradead.org:email,linux.dev:email,levanger:mid,kconfig-sym-check.pl:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3210362E61D

On Wed, May 27, 2026 at 09:27:03AM -0500, Andrew Jones wrote:
> Add 'make kconfig-sym-check', a static checker that finds Kconfig
> symbols referenced in expressions (select, depends on, default, etc.)
> but never defined via config/menuconfig anywhere in the tree. New
> dangling symbols are reported as errors (exit 1) unless they are
> listed in an exclusion file, e.g.
> 
>  KCONFIG_SYM_CHECK_EXCLUDES=sym-check-excludes make kconfig-sym-check
> 
> The exclusion file lists one symbol per line; blank lines and lines
> starting with '#' are ignored.
> 
> The checker also warns about uppercase N/Y/M used as tristate literal
> values following the same logic as checkpatch.
> 
> This new static checker is the script used for [1] with a few
> improvements to avoid some false positives.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=216748 [1]
> Assisted-by: Claude:claude-sonnet-4-6
> Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
> Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
> Tested-by: Randy Dunlap <rdunlap@infradead.org>
> Tested-by: Julian Braha <julianbraha@gmail.com>
> ---
> 
> Note, v1 was based on next-20260508 and this checker found 14 dangling
> symbols on that base. v4 is based on next-20260526 and there are now 15.
> EZX_PCAP has recently emerged as a new dangling symbol after commit
> b12d1da45f12 ("mfd: ezx-pcap: Remove unused driver") was merged.
> 
> v4:
>   - improved stripping of $(macro) expansions [Sashiko]
>   - improved failure when run without srctree parameter
>   - Added Julian's t-b
> 
> v3:
>   - Filter out scripts/kconfig/tests Kconfig files since they may
>     be wrong on purpose and indeed there is a 'config Y' in there
>     which would mask improper use of 'Y'. [Julian and Randy]
>   - Fixed breakage introduced in v2 when attempting to be too
>     clever...
>   - More changes from another sashiko review which required the
>     Perl to get even uglier. So ugly that I enlisted Claude to
>     help generate it.
>   - Added a sentence to the commit message to describe the excludes
>     file format.
> 
> v2:
>   - Added Andy's and Randy's tags
>   - Accept srctree as first argument so the Makefile can drop 'cd $(srctree)' [Nathan]
>   - Replace git ls-files with git+find fallback [Nathan and Andy]
>   - Changes thanks to sashiko's review
>     - strip quoted strings before inline comments to avoid '#' inside a string
>     - use [^)]* instead of .* in macro strip regex to avoid greedy match
>       eating tokens between adjacent $(macro) expansions
> 
>  Makefile                             |  23 +++--
>  scripts/kconfig/kconfig-sym-check.pl | 132 +++++++++++++++++++++++++++
>  2 files changed, 146 insertions(+), 9 deletions(-)
>  create mode 100755 scripts/kconfig/kconfig-sym-check.pl
> 
> diff --git a/Makefile b/Makefile
> index d59f703f9797..60c30116b95e 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -293,6 +293,7 @@ version_h := include/generated/uapi/linux/version.h
>  clean-targets := %clean mrproper cleandocs
>  no-dot-config-targets := $(clean-targets) \
>  			 cscope gtags TAGS tags help% %docs check% coccicheck \
> +			 kconfig-sym-check \
>  			 $(version_h) headers headers_% archheaders archscripts \
>  			 %asm-generic kernelversion %src-pkg dt_binding_check \
>  			 outputmakefile rustavailable rustfmt rustfmtcheck \
> @@ -1821,14 +1822,15 @@ help:
>  	 echo  '                    (default: $(INSTALL_HDR_PATH))'; \
>  	 echo  ''
>  	@echo  'Static analysers:'
> -	@echo  '  checkstack      - Generate a list of stack hogs and consider all functions'
> -	@echo  '                    with a stack size larger than MINSTACKSIZE (default: 100)'
> -	@echo  '  versioncheck    - Sanity check on version.h usage'
> -	@echo  '  includecheck    - Check for duplicate included header files'
> -	@echo  '  headerdep       - Detect inclusion cycles in headers'
> -	@echo  '  coccicheck      - Check with Coccinelle'
> -	@echo  '  clang-analyzer  - Check with clang static analyzer'
> -	@echo  '  clang-tidy      - Check with clang-tidy'
> +	@echo  '  checkstack        - Generate a list of stack hogs and consider all functions'
> +	@echo  '                      with a stack size larger than MINSTACKSIZE (default: 100)'
> +	@echo  '  versioncheck      - Sanity check on version.h usage'
> +	@echo  '  includecheck      - Check for duplicate included header files'
> +	@echo  '  headerdep         - Detect inclusion cycles in headers'
> +	@echo  '  coccicheck        - Check with Coccinelle'
> +	@echo  '  kconfig-sym-check - Check for dangling Kconfig symbol references'
> +	@echo  '  clang-analyzer    - Check with clang static analyzer'
> +	@echo  '  clang-tidy        - Check with clang-tidy'
>  	@echo  ''
>  	@echo  'Tools:'
>  	@echo  '  nsdeps          - Generate missing symbol namespace dependencies'
> @@ -2272,7 +2274,7 @@ endif
>  # Scripts to check various things for consistency
>  # ---------------------------------------------------------------------------
>  
> -PHONY += includecheck versioncheck coccicheck
> +PHONY += includecheck versioncheck coccicheck kconfig-sym-check
>  
>  includecheck:
>  	find $(srctree)/* $(RCS_FIND_IGNORE) \
> @@ -2287,6 +2289,9 @@ versioncheck:
>  coccicheck:
>  	$(Q)$(BASH) $(srctree)/scripts/$@
>  
> +kconfig-sym-check:
> +	$(Q)$(PERL) $(srctree)/scripts/kconfig/kconfig-sym-check.pl $(srctree) $(KCONFIG_SYM_CHECK_EXCLUDES)
> +
>  PHONY += checkstack kernelrelease kernelversion image_name
>  
>  # UML needs a little special treatment here.  It wants to use the host
> diff --git a/scripts/kconfig/kconfig-sym-check.pl b/scripts/kconfig/kconfig-sym-check.pl
> new file mode 100755
> index 000000000000..daa5285fdefc
> --- /dev/null
> +++ b/scripts/kconfig/kconfig-sym-check.pl
> @@ -0,0 +1,132 @@
> +#!/usr/bin/env perl
> +# SPDX-License-Identifier: GPL-2.0
> +
> +use warnings;
> +use strict;
> +
> +my $srctree = shift @ARGV;
> +unless (defined $srctree) {

unless (defined $srctree && -d $srctree) {

would also catch common attempts like 'kconfig-sym-check.pl --help' (at
least in most cases).


> +	$srctree = `git rev-parse --show-toplevel 2>/dev/null`;
> +	chomp $srctree;
> +	my $msg = "Usage: $0 <srctree> [excludes file]\n";
> +	$msg .= "Please provide <srctree>.";
> +	$msg .= " Is it '$srctree'?" if $srctree;
> +	$msg .= "\n";
> +	die $msg;
> +}
> +my $kconfig_sym_check_excludes = defined $ARGV[0] ? $ARGV[0] : undef;
> +
> +sub indent_depth {
> +	my ($ws) = @_;
> +	my $col = 0;
> +	for my $c (split //, $ws) {
> +		$col = $c eq "\t" ? int($col / 8) * 8 + 8 : $col + 1;
> +	}
> +	return $col;
> +}
> +
> +my @files = `git -C \Q$srctree\E ls-files '*Kconfig*' 2>/dev/null`;
> +if (@files) {
> +	chomp @files;
> +	@files = map { "$srctree/$_" } @files;
> +} else {
> +	@files = `find \Q$srctree\E -name '*Kconfig*'`;
> +	chomp @files;
> +}
> +
> +@files = grep { !m{/scripts/kconfig/tests/} } @files;
> +
> +my %configs = ();
> +my %refs = ();
> +
> +foreach my $file (@files) {
> +	open F, $file or die "Cannot open $file: $!";
> +
> +	my $help = 0;
> +	my $help_level;
> +	my $level;
> +
> +	while (<F>) {
> +		chomp;
> +
> +		while (/\\\s*$/) {
> +			s/\\\s*$/ /;
> +			my $cont = <F> // last;
> +			chomp $cont;
> +			$_ .= $cont;
> +		}
> +
> +		next if /^\s*$/;
> +		next if /^\s*#/;
> +
> +		/^(\s*)/;
> +		$level = indent_depth($1);
> +
> +		if ($help && $level < $help_level) {
> +			$help = 0;
> +		}
> +
> +		next if ($help);
> +
> +		if (/^\s*(help|\-\-\-help\-\-\-)$/) {
> +			$help = 1;
> +			my $next;
> +			while (defined($next = <F>)) {
> +				last unless $next =~ /^\s*(?:#.*)?$/;
> +			}
> +			last unless defined $next;
> +			$next =~ /^(\s*)/;
> +			if (indent_depth($1) >= $level) {
> +				$help_level = indent_depth($1);
> +			} else {
> +				$help = 0;
> +			}
> +			$_ = $next;
> +			redo;
> +		}
> +
> +		if (/^\s*(config|menuconfig)\s+([a-zA-Z0-9_]+)\s*(#.*)?$/) {

Sashiko claims that named choices are not catched here (but I could not
find any).  And all current findings of kconfig-sym-check look valid to
me, thus I don't see a strong need to adjust here for now.

> +			$configs{$2}++;
> +			next;
> +		}
> +
> +		if (/^\s*(default|def_bool|def_tristate|select|depends\s+on|imply|visible\s+if|range|if|bool|tristate|int|hex|string|prompt)\s+(.+)\s*$/) {
> +			my $s = $2;
> +			$s =~ s/"(?:[^"\\]|\\.)*"|'(?:[^'\\]|\\.)*'//g;
> +			$s =~ s/#.*//;
> +			$s =~ s/\$\((?:[^()]*|\((?:[^()]*|\([^()]*\))*\))*\)//g;
> +			$s =~ s/%%[^%]*%%//g;
> +			my @syms = split /[^a-zA-Z0-9_]+/, $s;
> +			map {
> +				$refs{$_}++ if (/[a-zA-Z]/ && $_ ne "if" && $_ ne "y" && $_ ne "n" && $_ ne "m" && !/^0[xX][0-9a-fA-F]+$/);
> +			} @syms
> +		}
> +	}
> +
> +	close F;
> +}
> +
> +my %known_syms = ();
> +if (defined $kconfig_sym_check_excludes) {
> +	my $file = $kconfig_sym_check_excludes;
> +	open(F, "<", $file) or die "Cannot open $file: $!";
> +	while (<F>) {
> +		chomp;
> +		next if /^\s*$/;
> +		next if /^\s*#/;
> +		$known_syms{$1}++ if (/^\s*([a-zA-Z0-9_]+)\s*(#.*)?$/);
> +	}
> +}
> +
> +my $ret = 0;
> +foreach my $k (sort keys %refs) {
> +	next if (exists $configs{$k} || exists $known_syms{$k});
> +
> +	print "$k";
> +	print " - warning: '$k' is probably not what you want; Kconfig tristate literals are always lowercase ('n', 'y', 'm')" if ($k eq "N" || $k eq "Y" || $k eq "M");
> +	print "\n";

Just bike-shedding:  I'd liked if kconfig-sym-check would output the
origin of its findings (gcc error style would help common tooling to
jump there, too).  But finding stray ever-undefined symbols is a good
thing, and finding these is no magic.

As my perl is in a quite bad state, I cannot review in-depth.  Would you
be available for maintaining the script yourself (= entry in
MAINTAINERS)?

Tested-by: Nicolas Schier <nsc@kernel.org>
Acked-by: Nicolas Schier <nsc@kernel.org>

