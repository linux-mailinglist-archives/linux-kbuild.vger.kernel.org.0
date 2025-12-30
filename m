Return-Path: <linux-kbuild+bounces-10382-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B1ECEAA32
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Dec 2025 21:55:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 332B6300F9C2
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Dec 2025 20:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5717B2E8DFD;
	Tue, 30 Dec 2025 20:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lt4tnjgo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE781F5847;
	Tue, 30 Dec 2025 20:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767128153; cv=none; b=ckIfZAyZPNsC+VGhaAkEidaJTzyyKf6kv7TmTGHmd1yeEiXljuwncysGl+yNkdVxQWvZryp4CUZqI+OcQpFICaItImjorZvR27YavaX3enijUbGCI64a1OyjUWBtr4+q5eVWNy++NlpYbv6NLRmWKbr0YxEa0TjsAkhtiUfLzJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767128153; c=relaxed/simple;
	bh=iXrmxeIpnjch23bkmHtE0q9f4prC0lYbUBNxc9z5lAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ls4wQ+wZpTGa0hrgqpHY6KGtMokowqnVj2Ju9VjocuTN6pd3vkhn9MsVk09Arl3IIzYsNsaAmSRFqKE0Dc+ViqzUtw1Z4uQ2EvnmS0qAlMK1QjvwdcBEojuNIKoUqGNkwiZ3e0BGLyRuhMcmpX+WUdS6/i8j04iDxe0UBbSnBwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lt4tnjgo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CA70C4CEFB;
	Tue, 30 Dec 2025 20:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767128152;
	bh=iXrmxeIpnjch23bkmHtE0q9f4prC0lYbUBNxc9z5lAk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lt4tnjgotNJYmYVD1707q1Cf9eFS/h4GgnstqowA/b6x29c7pmL093iYrIO1w7xy+
	 qnUpHS8AjLhBz/xXl9q8YvD1jbmX4YluH84C+2vSe8+ITJdH9gpJRfjdgrSQmM8VKC
	 ysMqoDNumXy0+r/jDb27j/2FjuKYjWB5xD515jTEJZnsPl8Dd6AiwKYxI756wYjsAm
	 xRJ3oj3ktzI97E/U99Gqbg0FbNXfWb8gMN8/3YQ/jWBFDpAsuxZajpt/2UzJ8m7q2u
	 +Ko1bUeIybGCodQhPNDVnbawr22OYUe0nxC4xIAyzkqFbKlDpM7nZJI6xYqP9/RG+N
	 pvmj2k+81jLsQ==
Date: Tue, 30 Dec 2025 13:55:49 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: Nicolas Schier <nsc@kernel.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] scripts: kconfig: merge_config.sh: refactor from
 shell/sed/grep to awk
Message-ID: <20251230205549.GE4062669@ax162>
References: <20251229114447.45236-1-mikko.rapeli@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251229114447.45236-1-mikko.rapeli@linaro.org>

Hi Mikko,

I don't really know awk well so I won't give as much review on that
part.

On Mon, Dec 29, 2025 at 01:44:45PM +0200, Mikko Rapeli wrote:
> From: Anders Roxell <anders.roxell@linaro.org>
> 
> merge_config.sh shell/sed/grep loop scales poorly and is slow.
> With Yocto genericarm64 kernel and around 190 config fragments
> the script takes more than 20 minutes to run on a fast build machine.
> Re-implementation with awk does the same job in 10 seconds.
> Using awk since it is likely available in the build environments
> and using perl, python etc would introduce more complex runtime
> dependencies. awk is good enough and lot better than shell/sed/grep.
> 
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>  scripts/kconfig/merge_config.sh | 161 ++++++++++++++++++++++++--------
>  1 file changed, 123 insertions(+), 38 deletions(-)
> 
> diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
> index 79c09b378be8..46397d7c6957 100755
> --- a/scripts/kconfig/merge_config.sh
> +++ b/scripts/kconfig/merge_config.sh
> @@ -16,8 +16,8 @@
>  set -e
>  
>  clean_up() {
> -	rm -f $TMP_FILE
> -	rm -f $MERGE_FILE
> +	rm -f "${TMP_FILE}"
> +	rm -f "${TMP_FILE}.new"
>  }
>  
>  usage() {
> @@ -121,7 +121,6 @@ SED_CONFIG_EXP1="s/^\(${CONFIG_PREFIX}[a-zA-Z0-9_]*\)=.*/\1/p"
>  SED_CONFIG_EXP2="s/^# \(${CONFIG_PREFIX}[a-zA-Z0-9_]*\) is not set$/\1/p"

The SED_CONFIG_EXP variables are unused now so they can be removed.

>  TMP_FILE=$(mktemp ./.tmp.config.XXXXXXXXXX)
> -MERGE_FILE=$(mktemp ./.merge_tmp.config.XXXXXXXXXX)
>  
>  echo "Using $INITFILE as base"
>  
> @@ -136,42 +135,128 @@ for ORIG_MERGE_FILE in $MERGE_LIST ; do
>  		echo "The merge file '$ORIG_MERGE_FILE' does not exist.  Exit." >&2
>  		exit 1
>  	fi
> -	cat $ORIG_MERGE_FILE > $MERGE_FILE
> -	CFG_LIST=$(sed -n -e "$SED_CONFIG_EXP1" -e "$SED_CONFIG_EXP2" $MERGE_FILE)
> -
> -	for CFG in $CFG_LIST ; do
> -		grep -q -w $CFG $TMP_FILE || continue
> -		PREV_VAL=$(grep -w $CFG $TMP_FILE)
> -		NEW_VAL=$(grep -w $CFG $MERGE_FILE)
> -		BUILTIN_FLAG=false
> -		if [ "$BUILTIN" = "true" ] && [ "${NEW_VAL#CONFIG_*=}" = "m" ] && [ "${PREV_VAL#CONFIG_*=}" = "y" ]; then
> -			${WARNOVERRIDE} Previous  value: $PREV_VAL
> -			${WARNOVERRIDE} New value:       $NEW_VAL
> -			${WARNOVERRIDE} -y passed, will not demote y to m
> -			${WARNOVERRIDE}
> -			BUILTIN_FLAG=true
> -		elif [ "x$PREV_VAL" != "x$NEW_VAL" ] ; then
> -			${WARNOVERRIDE} Value of $CFG is redefined by fragment $ORIG_MERGE_FILE:
> -			${WARNOVERRIDE} Previous  value: $PREV_VAL
> -			${WARNOVERRIDE} New value:       $NEW_VAL
> -			${WARNOVERRIDE}
> -			if [ "$STRICT" = "true" ]; then
> -				STRICT_MODE_VIOLATED=true
> -			fi
> -		elif [ "$WARNREDUN" = "true" ]; then
> -			${WARNOVERRIDE} Value of $CFG is redundant by fragment $ORIG_MERGE_FILE:
> -		fi
> -		if [ "$BUILTIN_FLAG" = "false" ]; then
> -			sed -i "/$CFG[ =]/d" $TMP_FILE
> -		else
> -			sed -i "/$CFG[ =]/d" $MERGE_FILE
> -		fi
> -	done
> -	# In case the previous file lacks a new line at the end
> -	echo >> $TMP_FILE
> -	cat $MERGE_FILE >> $TMP_FILE
> -done
> +	# Use awk for single-pass processing instead of per-symbol grep/sed
> +	if ! awk -v prefix="$CONFIG_PREFIX" \

Please use the AWK variable from Kbuild here:

  if ${AWK} -v prefix="$CONFIG_PREFIX" \

You can do something like:

  if [ -z "${AWK}" ]; then
      AWK=awk
  fi

towards the top of the script to have the script continue to work
outside of Kbuild as well.

> +		-v warnoverride="$WARNOVERRIDE" \
> +		-v strict="$STRICT" \
> +		-v builtin="$BUILTIN" \
> +		-v warnredun="$WARNREDUN" '
> +	BEGIN {
> +		strict_violated = 0
> +		cfg_regex = "^" prefix "[a-zA-Z0-9_]+"
> +		notset_regex = "^# " prefix "[a-zA-Z0-9_]+ is not set$"
> +	}
> +
> +	# Extract config name from a line, returns "" if not a config line
> +	function get_cfg(line) {
> +		if (match(line, cfg_regex)) {
> +			return substr(line, RSTART, RLENGTH)
> +		} else if (match(line, notset_regex)) {
> +			# Extract CONFIG_FOO from "# CONFIG_FOO is not set"
> +			sub(/^# /, "", line)
> +			sub(/ is not set$/, "", line)
> +			return line
> +		}
> +		return ""
> +	}
> +
> +	# Normalize: strip trailing comments, convert "is not set" to "=n"
> +	function normalize(line) {
> +		if (line == "") return ""
> +		sub(/[[:space:]]+#.*/, "", line)
> +		if (line ~ / is not set$/) {
> +			sub(/^# /, "", line)
> +			sub(/ is not set$/, "=n", line)
> +		}
> +		return line
> +	}
> +
> +	function warn_builtin(cfg, prev, new) {
> +		if (warnoverride == "true") return
> +		print cfg ": -y passed, will not demote y to m" > "/dev/stderr"
> +		print "  Previous value: " prev > "/dev/stderr"
> +		print "  New value:	 " new > "/dev/stderr"
> +		print "" > "/dev/stderr"
> +	}
> +
> +	function warn_redefined(cfg, prev, new) {
> +		if (warnoverride == "true") return
> +		print "Value of " cfg " is redefined by fragment " mergefile ":" > "/dev/stderr"
> +		print "  Previous value: " prev > "/dev/stderr"
> +		print "  New value:	 " new > "/dev/stderr"
> +		print "" > "/dev/stderr"
> +	}
> +
> +	function warn_redundant(cfg) {
> +		if (warnredun != "true" || warnoverride == "true") return
> +		print "Value of " cfg " is redundant by fragment " mergefile ":" > "/dev/stderr"
> +	}
> +
> +	# First pass: read merge file, store all lines and index
> +	FILENAME == ARGV[1] {
> +	        mergefile = FILENAME
> +		merge_lines[FNR] = $0
> +		merge_total = FNR
> +		cfg = get_cfg($0)
> +		if (cfg != "") {
> +			merge_cfg[cfg] = $0
> +			merge_cfg_line[cfg] = FNR
> +		}
> +		next
> +	}
>  
> +	# Second pass: process base file (TMP_FILE)
> +		cfg = get_cfg($0)
> +
> +		# Not a config or not in merge file - keep it
> +		if (cfg == "" || !(cfg in merge_cfg)) {

  I get an error on this line when trying to use this script via the arm64
  virtconfig target:

  $ make -skj"$(nproc)" ARCH=arm64 CROSS_COMPILE=aarch64-linux- clean virtconfig
  awk: cmd. line:70:              if (cfg == "" || !(cfg in merge_cfg)) {
  awk: cmd. line:70:              ^ syntax error
  make[2]: *** [arch/arm64/Makefile:222: virtconfig] Error 1
  ...

  $ awk --version | head -1
  GNU Awk 5.3.2, API 4.0, PMA Avon 8-g1, (GNU MPFR 4.2.2, GNU MP 6.3.0)

> +			print $0
> +			next
> +		}
> +
> +		prev_val = normalize($0)
> +		new_val = normalize(merge_cfg[cfg])
> +
> +		# BUILTIN: do not demote y to m
> +		if (builtin == "true" && new_val ~ /=m$/ && prev_val ~ /=y$/) {
> +			warn_builtin(cfg, prev_val, new_val)
> +			print $0
> +			skip_merge[merge_cfg_line[cfg]] = 1
> +			next
> +		}
> +
> +		# Values equal - redundant
> +		if (prev_val == new_val) {
> +			warn_redundant(cfg)
> +			next
> +		}
> +
> +		# Values differ - redefined
> +		warn_redefined(cfg, prev_val, new_val)
> +		if (strict == "true") {
> +			strict_violated = 1
> +		}
> +	}
> +
> +	END {
> +		# Newline in case base file lacks trailing newline
> +		print ""
> +		# Append merge file, skipping lines marked for builtin preservation
> +		for (i = 1; i <= merge_total; i++) {
> +			if (!(i in skip_merge)) {
> +				print merge_lines[i]
> +			}
> +		}
> +		if (strict_violated) {
> +			exit 1
> +		}
> +	}' \
> +	"$ORIG_MERGE_FILE" "$TMP_FILE" > "${TMP_FILE}.new"; then
> +		# awk exited non-zero, strict mode was violated
> +		STRICT_MODE_VIOLATED=true
> +	fi
> +	mv "${TMP_FILE}.new" "$TMP_FILE"
> +done
>  if [ "$STRICT_MODE_VIOLATED" = "true" ]; then
>  	echo "The fragment redefined a value and strict mode had been passed."
>  	exit 1
> -- 
> 2.34.1
> 

